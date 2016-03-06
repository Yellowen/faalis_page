class Faalis::Dashboard::Models::Sidebar
  def page_entries
    menu I18n.t('faalis.page.dashboard.pages'), icon: 'fa fa-file-o' do
      item(I18n.t('faalis.page.dashboard.pages'),
        model: 'Faalis::Page::Page',
        url: Faalis::Page::Engine.routes.url_helpers.dashboard_pages_path)
    end
  end
end
