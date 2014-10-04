if File.exists?([File.expand_path('../../../', __FILE__),
                 '.development'].join("/"))
  $LOAD_PATH <<  File.expand_path('../../../../Faalis/lib', __FILE__)
end

require 'faalis'


module FaalisPage
  # Page engine class for Faalis page plugin
  # mount this engine under `/`
  class Engine < ::Rails::Engine
  engine_name 'faalis_page'

    ::Faalis::Engine.setup do |config|
      config.models_with_permission = []
    end

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    #::Faalis::Plugins.register 'faalis_page', self
    ::Faalis::Engine.dashboard_js_manifest = 'faalis_page/application.js'
  end
end
