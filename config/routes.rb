Rails.application.routes.draw do
  resources :users
  post '/users/create_many', to: 'users#createMany'
  get '/csv_processor/process_csv/:senha', to: 'csv_processor#process_csv'
  get ':senha', to: 'csv_processor#process_csv', as: :root
  get '/index', to: 'users#index'
  

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
