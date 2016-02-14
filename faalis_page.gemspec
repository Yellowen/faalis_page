$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'faalis_page/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|

  s.licenses = ['GPL-2']
  s.name        = 'faalis-page'
  s.version     = FaalisPage::VERSION
  s.authors     = ['Sameer Rahmani']
  s.email       = ['lxsameer@gnu.org']
  s.homepage    = 'http://github.com/Yellowen/faalis_page'
  s.summary     = 'A Rails egnine to use with Faalis which provides page CRUD functionality base on markdown.'
  s.description = 'A Rails egnine to use with Faalis which provides page CRUD functionality base on markdown.'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']

  s.add_development_dependency 'sqlite3'
  s.add_dependency 'faalis'
  s.add_dependency 'globalize', '>= 5.0.0'
end
