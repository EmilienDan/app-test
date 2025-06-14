Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Afficher une offer
  get "offers", to: "offers#index"

  # Routes user pour faire réservation
  get "bookings/:id/payment/new", to: "payment#new", as: :new_payment
  post "bookings/:id/payment", to: "payment#create"
  get "bookings/:id", to: "bookings#show"

  # Routes user pour créer modifier supprimer une offer
  get "offers/new", to: "offers#new", as: :new_offer
  post "offers", to: "offers#create"
  get "offers/:id/edit", to: "offers#edit", as: :edit_offer
  patch "offers/:id", to: "offers#update"
  delete "offers/:id", to: "offers#destroy"

  # Routes pour l'user qui va accepter ou refuser une réservation
  get "bookings/:id/edit", to: "bookings#edit", as: :edit_booking
  patch "bookings/:id", to: "bookings#update"

  # Afficher le profile
  get "profile", to: "pages#profile"
  get "offers/:id", to: "offers#show", as: :offer

  resources :offers do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: %i[create update destroy]
end
