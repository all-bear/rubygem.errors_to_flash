$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "errors_to_flash/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "errors_to_flash"
  s.version     = ErrorsToFlash::VERSION
  s.authors     = ["Oleh Birjukov"]
  s.email       = ["ol.birjukov@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ErrorsToFlash."
  s.description = "TODO: Description of ErrorsToFlash."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
