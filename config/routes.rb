Rails.application.routes.draw do
  get '', to: 'home#index'

  namespace :api do
    get :lists, to: 'lists#index'
  end
end
