Rails.application.routes.draw do
  root "pets#index"
  devise_for :users
  resources :pet_adoptions
  resources :users
  resources :pets
  get 'thank_you', to: 'pet_adoptions#thank_you', as: 'thank_you'
  get 'adopted_pets', to: 'pets#adopted_pets', as: 'adopted_pets'
end
