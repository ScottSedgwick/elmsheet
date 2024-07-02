require 'bundler/setup'
require 'fileutils'
require 'rake/clean'
require_relative 'rakelib/json-schema-generator.rb'
require 'json-schema'


HTML_FILE     = 'output/index.html'
CSS_FILES     = Dir['assets/css/*.css']
CSS_DIR       = 'output/assets/css'
JS_FILE       = 'output/assets/js/elm.js'
JS_MIN_FILE   = 'output/assets/js/elm.min.js'
IMAGE_FILES   = Dir['assets/images/*.*']
IMAGE_DIR     = 'output/assets/images'

CLEAN.include(HTML_FILE)
CSS_FILES.each do |f|
    CLEAN.include("#{CSS_DIR}/#{File.basename(f)}")
end
CLEAN.include(JS_FILE)
CLEAN.include(JS_MIN_FILE)
IMAGE_FILES.each do |f|
    CLEAN.include("#{IMAGE_DIR}/#{File.basename(f)}")
end

file HTML_FILE do
    FileUtils.mkdir_p('output')
    FileUtils.cp('assets/index.html', HTML_FILE)
end

task :css_assets do
    FileUtils.mkdir_p('output')
    FileUtils.mkdir_p('output/assets')
    FileUtils.mkdir_p('output/assets/css')
    CSS_FILES.each do |f|
        FileUtils.cp(f, "#{CSS_DIR}/#{File.basename(f)}")
    end
end

task :image_assets do
    FileUtils.mkdir_p('output')
    FileUtils.mkdir_p('output/assets')
    FileUtils.mkdir_p('output/assets/images')
    IMAGE_FILES.each do |f|
        FileUtils.cp(f, "#{IMAGE_DIR}/#{File.basename(f)}")
    end
end

task :build => [:clean, :generate, :css_assets, HTML_FILE, :image_assets] do
    FileUtils.mkdir_p('output')
    FileUtils.mkdir_p('output/assets')
    FileUtils.mkdir_p('output/assets/js')
    sh("elm make src/Main.elm --output=output/assets/js/elm.js")
end

task :deploy => [:clean, :generate, :css_assets, HTML_FILE, :image_assets] do
    FileUtils.mkdir_p('output')
    FileUtils.mkdir_p('output/assets')
    FileUtils.mkdir_p('output/assets/js')
    sh("elm make src/Main.elm --optimize --output=output/assets/js/elm.js")
    sh('uglifyjs output/assets/js/elm.js --compress "pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe" | uglifyjs --mangle --output output/assets/js/elm.min.js')
    FileUtils.rm('output/assets/js/elm.js')
    FileUtils.mv('output/assets/js/elm.min.js', 'output/assets/js/elm.js')
end

task :generate do
    schema = Schema.new("data/schema.json", "Model")
    schema.objects.each do |obj|
        File.open("src/Model/#{obj.name}.elm", 'w') do |f|
            obj.generate_file(f)
        end
    end
end

