Rails.application.routes.draw do
  root "pets#index"
  devise_for :users
  resources :pet_adoptions, only: [:new, :create, :show, :destroy]
  resources :users
  resources :pets
  resources :user_adoptions, only: [:index, :destroy]

  get 'thank_you', to: 'pet_adoptions#thank_you', as: 'thank_you'
  get 'adopted_pets', to: 'pets#adopted_pets', as: 'adopted_pets'
  get 'pets/:id/confirmation', to: 'pets#confirmation', as: 'confirmation_pet'
end
