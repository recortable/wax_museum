$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gdocstatic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gdocstatic"
  s.version     = Gdocstatic::VERSION.dup
  s.authors     = ["Danigb"]
  s.email       = ["danigb@gmail.com"]
  s.homepage    = "https://github.com/recortable/gdocstatic"
  s.summary     = "Another static pages rails engine"
  s.description = "GdocStatic fetches the content from a specified google doc."

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "sass-rails", "~> 3.1"
  s.add_dependency "nokogiri"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "minitest"
end
