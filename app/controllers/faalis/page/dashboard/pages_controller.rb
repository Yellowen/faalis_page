class Faalis::Page::Dashboard::PagesController < ::Dashboard::ApplicationController
  engine 'Faalis::Page::Engine'

  in_index do |page|
    page.attributes :id, :title, :permalink, :url, :published, :members_only
  end

  in_form do |form|
    form.attributes :title, :permalink, :layout, :tags, :published, :members_only, :description, :raw_content
  end

  private

  def before_create_hook(resource)
    resource.user = current_user

    resource.site = SiteFramework.current_site
  end
end
