Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "main#welcome"
  resources :products do
    get 'search', on: :collection
  end
  resources :categories

end
