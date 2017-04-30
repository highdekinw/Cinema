Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'

  #post '/confirm', to: 'seats#confirm', controller: 'seats'

  resources :movies do
  	resources :schedules do
  		resources :seats do
  			collection do
  				post 'confirm'
  			end
  		end
  	end
  end 
end
