Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session
  resource :registration
  resource :password_reset
  resource :password

  resources :slides
  resources :slideshows
  resources :screens
  
  get "/slideshows/:id/manage", to: "slideshows#manage", as: "manage_slideshow"
  resources :slide_mappings, only: [:edit, :update]

  get "/screens/:id/manage", to: "screens#manage", as: "manage_screen"
  resources :slideshow_mappings, only: [:edit, :update]

  get "/screens/:id/display", to: "screens#display", as: "display_screen"

  # Reveal health stat  us on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "main#index"
end
