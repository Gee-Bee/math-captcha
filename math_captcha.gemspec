$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "math_captcha/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "math_captcha"
  s.version     = MathCaptcha::VERSION
  s.authors     = ["Greg Bunia"]
  s.email       = ["greg.bunia@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MathCaptcha."
  s.description = "TODO: Description of MathCaptcha."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 4.0.0"
  s.add_dependency "sass-rails"
  s.add_dependency "ezcrypto", "~> 0.7.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "pry-byebug"
end
