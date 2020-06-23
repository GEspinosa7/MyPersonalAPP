Rails.application.routes.draw do
  resources :trainings
	scope :defaults => { :format => 'application/json' } do
  		resources :clients, only: [:create, :update, :destroy] do 
  			get 'me', on: :collection
  	end
  end

	scope :defaults => { :format => 'application/json' } do
  		resources :trainers, only: [:create, :update, :destroy] do 
  			get 'me', on: :collection
  	end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
