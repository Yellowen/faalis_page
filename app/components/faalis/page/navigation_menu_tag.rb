module Faalis
  module Page
    class NavigationMenuTag < ::Faalis::Liquid::RenderTag
      tag_name 'navigation_menu'
      view     'tags/faalis/page/navigation_menu/'

      argument name: theme_name

      def before_render(context)
        @items = Menu.published.where(name: params[:theme_name])
      end

      def _view
        "#{super}#{menu_name}"
      end

      def menu_name
        params[:theme_name]
      end
      end
    end
  end
end
