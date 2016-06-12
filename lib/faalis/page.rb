require 'kramdown'
require 'site_framework'
require 'rails-assets-bootstrap-treeview'

module Faalis
  module Page
    module Components
      autoload :Menu, 'faalis/page/components/menu'
    end
  end
end

require 'faalis/page/engine'
require 'faalis/page/sidebar'
require 'faalis/page/version'
