$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wax_museum/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wax_museum"
  s.version     = WaxMuseum::VERSION.dup
  s.authors     = ["Danigb"]
  s.email       = ["danigb@gmail.com"]
  s.homepage    = "https://github.com/recortable/wax_museum"
  s.summary     = "Another static pages rails engine"
  s.description = "WaxMuseum fetches the content from a specified google doc to show a static page."

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "sass-rails", "~> 3.1"
  s.add_dependency "nokogiri"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency("rspec-rails")
  s.add_development_dependency("capybara", ">= 0.4.0")
end
