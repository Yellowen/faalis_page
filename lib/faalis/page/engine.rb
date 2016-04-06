module Faalis::Page
  # Page engine class for Faalis page plugin
  # mount this engine under `/`
  class Engine < ::Rails::Engine
    engine_name 'faalis_page'
    isolate_namespace Faalis::Page

    config.generators do |g|
      g.test_framework      :minitest, fixture_replacement: :fabrication
      g.fixture_replacement :fabrication, dir: "test/fabricators"
      g.integration_tool    :minitest
      g.assets              false
      g.helper              false
    end

    mattr_accessor :use_site_framework
    @@use_site_framework = false

    def self.setup
      yield self
    end
  end
end
