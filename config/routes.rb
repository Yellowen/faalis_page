Faalis::Page::Engine.routes.draw do
  in_dashboard do
    resources :pages
  end

  get '/pages/:permalink', to: 'pages#show', as: :page
end
