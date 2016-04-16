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
      puts ",<<<<<<<<<<<<<<<<", data, data.class
      @nodes ||= data.map do |node|
        puts ">>>>>>", node.class, node
        title = node.delete(:title)
        fail ArgumentError.new "Can not find title attribute on '#{node}'" unless title
        Faalis::Dashboard::Models::RootMenu.new(title, node)
      end
    end

    def data
      _data = read_attribute(:data)
      _data.map do |node|
        ActiveSupport::HashWithIndifferentAccess.new(**node)
      end
    end
  end
end
