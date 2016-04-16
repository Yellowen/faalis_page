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

require 'test_helper'

class Faalis::Page::PagesControllerTest < ::ActionController::TestCase
end
