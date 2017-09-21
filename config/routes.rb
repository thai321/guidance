Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index , :create, :show, :update]
    resource :session, only: [:create, :destroy]

    resources :projects, only: [:create, :index, :show, :destroy, :update]
  end

  root to: 'static_pages#root'
end
