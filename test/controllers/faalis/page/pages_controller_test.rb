require 'test_helper'

module Faalis::Page
  class Page::PagesControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
