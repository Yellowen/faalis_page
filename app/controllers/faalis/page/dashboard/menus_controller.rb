module Faalis::Page::Dashboard
  class MenusController < ::Dashboard::ApplicationController
    engine '::Faalis::Page::Engine'

    override_views :new, :edit

    in_index do |resource|
      resource.attributes :title, :site, :published, :created_at
    end
  end
end
