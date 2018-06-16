Rails.application.routes.draw do
  root to: 'static_pages#index'
  resources :sessions, only:[:new, :create, :destroy]
  resources :users, only:[:new, :create, :show]
  get 'users/:id/favorites', to: 'users#favorites'
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :favorites, only:[:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/inbox"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
