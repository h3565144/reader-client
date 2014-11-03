# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group :l do
  guard 'livereload' do
    watch(%r{app/views/.+\.(erb|haml|slim)$})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/locales/.+\.yml})
    # Rails Assets Pipeline
    watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }

    watch(%r{app/assets/javascripts/(.+)\.(js|coffee)}) { |m| "/assets/#{m[1]}.js" }
  end
end
