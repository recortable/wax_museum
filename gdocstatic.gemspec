$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gdocstatic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gdocstatic"
  s.version     = Gdocstatic::VERSION.dup
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Gdocstatic."
  s.description = "TODO: Description of Gdocstatic."

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "nokogiri"

  s.add_development_dependency "sqlite3"
end
