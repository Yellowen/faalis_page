module Faalis::Page
  # Page engine class for Faalis page plugin
  # mount this engine under `/`
  class Engine < ::Rails::Engine
    engine_name 'faalis_page'
    isolate_namespace Faalis::Page

    mattr_accessor :use_site_framework
    @@use_site_framework = false

    def self.setup
      yield self
    end
  end
end
