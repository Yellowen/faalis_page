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
