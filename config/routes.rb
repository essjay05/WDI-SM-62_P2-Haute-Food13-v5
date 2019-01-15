Rails.application.routes.draw do
  
  #USERS routes
  #Root is home/index/landing page
  root to: 'pages#index'
  
  resources :users do #Automatically generates all RESTful routes for provided resources
    resources :posts
  
  end

  # SESSIONS Routes
  resources :sessions, only: [:new, :create] #Populate RESTful routes for new and create only
  delete '/logout' => 'sessions#destroy', as: :logout

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
