Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      get 'employees/index'
      get 'employees/show'
    end
  end
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :employees, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
