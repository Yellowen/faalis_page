module Faalis::Page
  class Page < Faalis::ORM.proper_base_class

    include Faalis::Concerns::Authorizable

    if Faalis::ORM.mongoid?
      include Mongoid::Document
      include Mongoid::Timestamps

      field :title
      field :layout
      field :tags
      field :description
      field :permalink
      field :published, type: Boolean, default: false
      field :members_only, type: Boolean, default: false
      # Should be fixed for mongoid
      field :user_id
      field :raw_content
    end

    belongs_to :user, class_name: 'Faalis::User'

    def url
      #Engine.routes.url_helpers.page_url({ permalink: permalink })
      permalink
    end

    def can_view?(current_user)
      published && members_only
    end
  end
end
