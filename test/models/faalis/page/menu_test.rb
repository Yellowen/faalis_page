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

require 'test_helper'

module Faalis::Page
  class Page::MenuTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
  end
end
