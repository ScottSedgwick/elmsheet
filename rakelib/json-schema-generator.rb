require 'json'

class Schema
    attr_accessor :objects, :namespace

    def initialize(schemafile, namespace)
        # Load file
        json = JSON.load(File.open(schemafile))
        # Parse schema
        @objects = []
        @namespace = namespace
        json["definitions"].each_key do |name|
            d = json["definitions"][name]
            if d["type"] == "object"
                @objects.append(SchemaObject.new(name, d, @namespace))
            else
                puts "Unknown schema type #{d["type"]} for #{name}."
            end
        end
    end
end

class SchemaObject
    attr_reader :name, :props, :namespace

    def initialize(name, obj, namespace)
        @name = name.capitalize
        @namespace = namespace
        @props = []
        required = obj["required"]
        props = obj["properties"]
        props.each_key do |k|
            t = get_type(props[k]["type"])
            if t == "Array"
                st = props[k]["items"]["type"]
                t = "List #{st.capitalize}"
            end
            @props.append(SchemaProperty.new(k, t, required.include?(k)))
        end
    end

    def generate_file(f)
        f.write("module #{@namespace}.#{@name} exposing ( #{@name}, #{@name.downcase}Encoder, #{@name.downcase}Decoder, init#{@name},\n  #{get_lenses.each_slice(10).map {|a| a.join(', ') }.join(",\n  ")} )\n\n")
        f.write("-- THIS MODULE IS AUTO-GENERATED. Do not edit it - change the generator.\n\n")
        f.write("import Json.Decode as Decode\n")
        f.write("import Json.Decode.Pipeline exposing ( optional, required )\n")
        f.write("import Json.Encode as Encode\n")
        f.write("import Monocle.Lens exposing (Lens)\n")

        @props.each do |prop|
            if prop.type.start_with?('List ')
                name = prop.type[5..-1]
                f.write("import #{@namespace}.#{name} exposing ( #{name}, #{name.downcase}Encoder, #{name.downcase}Decoder, init#{name} )\n")
            end
        end
        
        f.write("\n-- Type definition for #{@name}\n")
        generate_definition(f)

        f.write("\n-- Lenses for #{@name}\n")
        generate_lenses(f)

        f.write("\n-- JSON Encoder for #{@name}\n")
        generate_encoder(f)

        f.write("\n-- JSON Decoder for #{@name}\n")
        generate_decoder(f)

        f.write("\n-- Initial value for #{@name}\n")
        generate_initial(f)
    end

    def generate_definition(f)
        f.write("\ntype alias #{@name.capitalize} = \n  { ")
        f.write( @props.map { |prop| prop.definition }.join("\n  , ") )
        f.write("\n  }\n")
    end

    def get_lenses
        @props.map { |s| s.name }
    end

    def generate_lenses(f)
        @props.each do |prop|
            f.write(prop.lens(@name))
        end
    end

    def generate_encoder(f)
        f.write("\n#{decap(@name)}Encoder : #{name} -> Encode.Value\n")
        f.write("#{decap(@name)}Encoder x = Encode.object\n  [ ")
        f.write(@props.map { |prop| prop.encoder }.join("\n  , "))
        f.write("\n  ]\n")
    end

    def generate_decoder(f)
        f.write("\n#{decap(@name)}Decoder : Decode.Decoder #{name}\n")
        f.write("#{decap(@name)}Decoder = Decode.succeed #{@name}\n")
        @props.each do |prop|
            f.write(prop.decoder)
        end
    end

    def generate_initial(f)
        f.write("init#{@name} : #{@name}\n")
        f.write("init#{@name} =\n  { ")
        f.write(@props.map { |prop| prop.initline }.join("\n  , "))
        f.write("\n  }\n")
    end

    def get_type(t)
        if t == "string"
            "String"
        elsif t == "number"
            "Int"
        elsif t == "boolean"
            "Bool"
        else
            t.capitalize
        end
    end
end

class SchemaProperty
    attr_reader :name, :type, :required

    def initialize(name, type, required)
        @name = name
        @type = type
        @required = required
    end

    def definition
        "#{@name}_ : #{@type}"
    end

    def lens(parent)
        t = @type.start_with?("List") ? "(#{@type})" : @type
        "\n#{@name} : Lens #{parent} #{t}\n#{@name} = Lens .#{@name}_ (\\b a -> { a | #{@name}_ = b } )\n"
    end

    def encoder
        if @type.start_with?("List")
            e = "Encode.list #{decap(@type[5..-1])}Encoder"
        else
            e = "Encode.#{decap(@type)}"
        end
        "(\"#{@name}\", #{e} x.#{@name}_)"
    end

    def decoder
        iv = @required ? '' : " #{initvalue}"
        if @type.start_with?("List")
            "  |> #{@required ? "required" : "optional"} \"#{@name}\" (Decode.list #{decap(@type[5..-1])}Decoder)#{iv}\n"
        else
            "  |> #{@required ? "required" : "optional"} \"#{@name}\" Decode.#{decap(@type)}#{iv}\n"
        end
    end

    def initline
        "#{@name}_ = #{initvalue}"
    end

    def initvalue
        if @type == "String"
            "\"\""
        elsif @type == "Int"
            "0"
        elsif @type == "Bool"
            "False"
        elsif @type.start_with?("List")
            name = @type[5..-1]
            "[ init#{name}, init#{name}, init#{name}, init#{name}, init#{name} ]"
        else
            "<Unknown Type>"
        end
    end
end

def decap(str)
    str[0].downcase + str[1..-1]
end