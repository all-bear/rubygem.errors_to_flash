$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "errors_to_flash/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "errors_to_flash"
  s.version     = ErrorsToFlash::VERSION
  s.authors     = ["Oleh Birjukov"]
  s.email       = ["ol.birjukov@gmail.com"]
  s.homepage    = "https://gitlab.com/ror_g/errors-to-flash"
  s.summary     = "Add all errors of model to flash[:error]."
  s.description = "Add all errors of model to flash[:error]. Model must implement method 'errors'"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
