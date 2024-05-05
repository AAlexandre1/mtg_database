Rails.application.routes.draw do
  # get 'sessions/create'
  resources :cards
  resources :players
  resources :decks
  resources :wishlist_cards
  resources :deck_cards
  resources :player_cards
  resources :manas
  resources :types

  # post '/login', to: 'sessions#create'
end
