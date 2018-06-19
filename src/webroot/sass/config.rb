# require 'compass/import-once/activate'

# sass_path: the directory your Sass files are in. THIS file should also be in the Sass folder
# Generally this will be in a resources/sass folder
# <root>/resources/sass
sass_path = File.dirname(__FILE__)

# css_path: the directory you want your CSS files to be.
# Generally this is a folder in the parent directory of your Sass files
# <root>/resources/css
css_path = File.join(sass_path, "..", "css")

# Disable sass cache
# asset_cache_buster = :none
# cache = false

# Minify CSS output
output_style = :compressed

# Disable SASS line comments in CSS files
# line_comments = false

# Specify include directory
Sass.load_paths << File.join(sass_path, 'variables', 'default')



$ext_path = "../"
$ext_relative_path = "../../../../../webroot/lib/extjs"

# We need to load in the Ext4 themes folder, which includes all it's default styling, images, variables and mixins
# load File.join(File.dirname(__FILE__), $ext_path, 'resources', 'themes')
load File.join(File.dirname(__FILE__), $ext_relative_path, 'resources', 'themes')