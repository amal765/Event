Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   authenticated :user do
    root 'events#index', as: :authenticated_root
  end
  root 'events#show'

  resources :events do
    collection do
      put 'search', to: 'events#find_events'
      get 'category', to: 'events#category_events'
    end
  end

  resources :events do
    member do
      get 'approve', to: 'events#approve_event'
    end
  end
  resources :users

end
