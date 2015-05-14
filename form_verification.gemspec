$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "form_verification/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "form_verification"
  s.version     = FormVerification::VERSION
  s.authors     = ["Valentin Ballestrino"]
  s.email       = ["vala@glyph.fr"]
  s.homepage    = "http://www.glyph.fr"
  s.summary     = "Verify that your Rails forms are not submitted by robots"
  s.description = "Verify that your Rails forms are not submitted by robots"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0", "<= 5.0.0"

  s.add_development_dependency "sqlite3"
end
