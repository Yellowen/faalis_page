$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'faalis_page/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|

  s.licenses = ['GPL-2']
  s.name        = 'faalis_page'
  s.version     = FaalisPage::VERSION
  s.authors     = ['Sameer Rahmani']
  s.email       = ['lxsameer@gnu.org']
  s.homepage    = 'http://github.com/Yellowen/faalis_page'
  s.summary     = 'A Rails page plugin to use with Faalis.'
  s.description = 'A Rails page plugin to use with Faalis.'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.0.4'

  s.add_development_dependency 'sqlite3'
  s.add_dependency 'faalis'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'uglifier', '>= 1.3.0'
  s.add_dependency 'sass-rails', '~> 4.0.0'
  s.add_dependency 'jbuilder', '~> 1.2'
  s.add_dependency 'globalize', '>= 4.0.0.alpha.2'
end
