Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index , :create, :show, :update]
    resource :session, only: [:create, :destroy]

    resources :projects, only: [:create, :index, :show, :destroy, :update]

    resources :steps, only: [:index, :create, :update, :show, :destroy]

    resources :comments, only: [:index, :create, :update, :show]

    resources :favorites, only: [:create, :destroy]

    resources :follows, only: [:index, :create, :destroy]

    resources :tags, only: [:index]
  end

  root to: 'static_pages#root'
end
