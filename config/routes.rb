Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index , :create, :show, :update]
    resource :session, only: [:create, :destroy]

    resources :projects, only: [:create, :index, :show, :destroy, :update]

    resources :steps, only: [:index, :create, :update, :show, :destroy]

    resources :comments, only: [:index, :create, :update, :show]
  end

  root to: 'static_pages#root'
end
