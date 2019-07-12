Rails.application.routes.draw do
  get 'rails/generate'
  get 'rails/controller'
  get 'rails/StaticPages'
  get 'rails/home'
  get 'rails/help'
  root 'application#hello'
end