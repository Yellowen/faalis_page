# == Schema Information
#
# Table name: faalis_page_menus
#
#  id         :integer          not null, primary key
#  title      :string
#  site_id    :integer
#  published  :boolean          default(FALSE)
#  user_id    :integer
#  items      :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  domain_id  :integer
#

module Faalis::Page
  class Menu < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware

    belongs_to :user, class_name: 'Faalis::User'
    belongs_to :site, class_name: 'SiteFramework::Site'

    scope :published, -> { where(published: true) }

    validates_presence_of :title

    def nodes
      return @nodes if @nodes
      @nodes = ::Faalis::Dashboard::Models::RootMenu.new

      data.map do |node|
        title = node.delete('title')
        fail ArgumentError.new "Can not find title attribute on '#{node.to_s}'" unless title

        @nodes << ::Faalis::Dashboard::Models::Menu.new(title, node)
      end

      @nodes
    end

    def data
      _data = read_attribute(:data)
      _data.map do |node|
        ::ActiveSupport::HashWithIndifferentAccess.new(node)
      end
    end
  end
end
