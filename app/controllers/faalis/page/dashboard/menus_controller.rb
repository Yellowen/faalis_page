module Faalis::Page::Dashboard
  class MenusController < ::Dashboard::ApplicationController
    engine '::Faalis::Page::Engine'

    override_views :new, :edit

    in_index do |resource|
      resource.attributes :title, :site, :published, :created_at
    end

    private

    def before_create_hook(resource)

      resource.user = current_user
      resource.site = SiteFramework::CurrentState.instance.site
      #TODO: Remove this line when we patched domain aware concern
      resource.domain = SiteFramework::CurrentState.instance.domain
    end
  end
end
