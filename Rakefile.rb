require 'fileutils'
require 'rake/clean'

HTML_FILE   = 'output/index.html'
CSS_FILES   = Dir['assets/css/*.css']
CSS_DIR     = 'output/assets/css'
JS_FILE     = 'output/assets/js/elm.js'
IMAGE_FILES = Dir['assets/images/*.*']
IMAGE_DIR   = 'output/assets/images'

CLEAN.include(HTML_FILE)
CSS_FILES.each do |f|
    CLEAN.include("#{CSS_DIR}/#{File.basename(f)}")
end
CLEAN.include(JS_FILE)
IMAGE_FILES.each do |f|
    CLEAN.include("#{IMAGE_DIR}/#{File.basename(f)}")
end

file HTML_FILE do
    FileUtils.mkdir_p('output')
    FileUtils.cp('assets/index.html', HTML_FILE)
end

file JS_FILE do
    FileUtils.mkdir_p('output')
    FileUtils.mkdir_p('output/assets')
    FileUtils.mkdir_p('output/assets/js')
    sh("elm make src/Main.elm --output=output/assets/js/elm.js")
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

task :build => [:clean, JS_FILE, :css_assets, HTML_FILE, :image_assets]