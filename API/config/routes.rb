Rails.application.routes.draw do
  resources :ratings
  resources :contracts
  resources :trainings
	scope :defaults => { :format => 'application/json' } do
  		resources :clients do 
  			get 'me', on: :collection
  	end
  end

	scope :defaults => { :format => 'application/json' } do
  		resources :trainers do 
			  get 'me', on: :collection
  	end
  end

#   resources :trainers 
#   resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
