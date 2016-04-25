$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'faalis/page/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|

  s.licenses = ['GPL-2']
  s.name        = 'faalis-page'
  s.version     = Faalis::Page::VERSION
  s.authors     = ['Sameer Rahmani']
  s.email       = ['lxsameer@gnu.org']
  s.homepage    = 'http://github.com/Yellowen/faalis_page'
  s.summary     = 'A Rails egnine to use with Faalis which provides page CRUD functionality base on markdown.'
  s.description = 'A Rails egnine to use with Faalis which provides page CRUD functionality base on markdown.'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'faalis'
  s.add_dependency 'redcarpet'
  s.add_dependency 'site_framework'
  s.add_dependency 'rails-assets-bootstrap-treeview'
end
