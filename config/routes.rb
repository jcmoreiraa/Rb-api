Rails.application.routes.draw do
  resources :users
  post '/users/create_many', to: 'users#createMany'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
