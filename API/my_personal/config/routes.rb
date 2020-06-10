Rails.application.routes.draw do
  resources :trainers, only: [:create, :update, :destroy] do 
  	get 'me', on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
