Rails.application.routes.draw do
  
  resources :pets do
    resources :pet_histories
  end
  resources :clients
  root 'clients#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
