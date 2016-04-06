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
  end
end
