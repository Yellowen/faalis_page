# == Schema Information
#
# Table name: faalis_page_pages
#
#  id           :integer          not null, primary key
#  title        :string
#  layout       :string           default("layouts/page")
#  description  :string
#  tags         :string
#  permalink    :string
#  user_id      :integer
#  raw_content  :text
#  content      :text
#  members_only :boolean          default(FALSE)
#  published    :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  domain_id    :integer
#

module Faalis::Page
  class Page < Faalis::ORM.proper_base_class

    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware

    if ::Faalis::ORM.mongoid?
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

    scope :published, -> { where(published: true) }

    validates_presence_of :title

    before_save :render_content

    def url
      #Engine.routes.url_helpers.page_url({ permalink: permalink })
      permalink
    end

    def can_view?(current_user)
      if members_only
        return published && user == current_user
      end
      published
    end

    private

    def render_content
      unless raw_content.blank?
        markdown = ::Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        self.content  = markdown.render(raw_content)
      end
    end

  end
end
