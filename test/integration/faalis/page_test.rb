require "test_helper"

class PageTest < ActionDispatch::IntegrationTest

  before do
    ::Faalis::Page::Engine.use_site_framework = false
  end

  test "renders the markdown content of the given test." do
    Fabricate(:page, published: true, title: 'page=1', permalink: 'page-1', raw_content: '#test')

    visit '/pages/page-1'

    assert_equal 200, page.status_code
    assert_text "page=1"
    assert_selector "article h1", text: 'test'
  end

  test "drops accesss to members only pages by anonymous users" do
    Fabricate(:page, published: true, title: 'page=1', members_only: true,
              permalink: 'page-1', raw_content: '#test')

    visit '/pages/page-1'

    assert_equal 403, page.status_code
    assert_no_text "page=1"
    assert_no_selector "article h1", text: 'test'
  end

  test "grant accesss to members only pages by signed in users" do
    Fabricate(:page, published: true, title: 'page=1', members_only: true,
              permalink: 'page-1', raw_content: '#test')
    Fabricate(:user, email: 'a@a.aa', password: '123123123', password_confirmation: '123123123')
    login_as(Faalis::User.find_by(email: 'a@a.aa'), scope: :user)

    visit '/pages/page-1'

    assert_equal 200, page.status_code
    assert_text "page=1"
    assert_selector "article h1", text: 'test'
  end
end
