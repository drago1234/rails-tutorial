Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home'
  get  '/help',    to: 'static_pages#help'
  #Same as: get  '/help' => 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  root 'static_pages#home'
  # root 'application#hello'
end
