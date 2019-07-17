Rails.application.routes.draw do
  # get 'users/new'
  # get 'static_pages/home'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users 
end
  # get  '/help',    to: 'static_pages#help' is same as: get  '/help' => 'static_pages#help'
  # Above code: it endows our sample application with all the actions needed for a RESTful Users resource,6 along with a large number of named routes (Section 5.3.3) for generating user URLs.

