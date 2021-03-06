Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: [:create, :new, :edit, :update] do
    resources :messages, only: [:index, :create]
  end

  resources :users, only: [] do
    collection do
      get 'search'
    end
  end
end

