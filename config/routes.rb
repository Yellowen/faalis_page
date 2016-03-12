Faalis::Page::Engine.routes.draw do
  in_dashboard do
    resources :menus
    resources :pages
  end

  if ::Faalis::Page::Engine.use_site_framework
    sites self do
        get '/pages/:permalink', to: 'pages#show', as: :page
    end
  else
    get '/pages/:permalink', to: 'pages#show', as: :page
  end
end
