module Faalis::Page
  class PagesController < ::ApplicationController
    def show
      @page = ::Faalis::Page::Page.published.find_by(permalink: params[:permalink])

      lputs @page
      return not_found if @page.nil?
      return not_authorized unless @page.can_view?(current_user)

      layout = 'page'
      layout = @page.layout unless @page.layout.blank?

      render '/faalis/pages/show', layout: layout
    end

    private

    def not_found
      raise ::ActionController::RoutingError.new(t('faalis.page.not_found'))
    end

    def not_authorized
      render '/403', status: 403, layout: false
    end
  end
end
