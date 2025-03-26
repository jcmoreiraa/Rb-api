Rails.application.routes.draw do
  resources :users
  post '/users/create_many', to: 'users#createMany'
  get '/csv_processor/process_csv', to: 'csv_processor#process_csv'
  root 'csv_processor#process_csv'  

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
