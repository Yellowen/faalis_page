Rails.application.routes.draw do
  mount Faalis::Engine => '/'
  mount Faalis::Page::Engine => '/'
end
