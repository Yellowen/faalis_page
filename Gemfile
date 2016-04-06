source "http://rubygems.org"

source 'http://rails-assets.org' do
  gem 'rails-assets-bootstrap-treeview'
  group :development, :test do
    gem 'rails-assets-bootstrap-rtl'
    gem 'rails-assets-jquery-knob'
    gem 'rails-assets-bootstrap-daterangepicker'
    gem 'rails-assets-jquery-sparkline'
    gem 'rails-assets-jquery-icheck'
    gem 'rails-assets-admin-lte'
    gem 'rails-assets-sugar', '1.4.1'
  end
end

# Declare your gem's dependencies in faalis_page.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

group :development do
  gem 'faalis', path:'../Faalis'
  gem "site_framework", path: '../site_framework'
end
