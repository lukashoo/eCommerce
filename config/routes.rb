Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users



#user views
  get '/unpaid', to:'invoices#index_unpaid', as:'unpaid_invoices'
  get '/invoices', to: 'invoices#index_user_invoices', as:'my_invoices'
  get '/invoice/:id', to: 'invoices#show', as: 'invoice'

  get '/payments', to: 'charges#index_user', as:'my_payments'

  get '/apartments', to:'apartments#index_user', as: 'my_apartments'
  get '/apartment_building/:id', to:'apartment_buildings#show', as:'apartment_building'

  get '/apartments/:id', to: 'apartments#show', as: 'apartment' 
  patch '/apartments/:id', to:'apartments#update_user'
  put '/apartments/:id', to:'apartments#update_user'

resources :charges
 # ADMIN

  get '/invoices/new', to: 'invoices#new', as: 'invoice_new'
  get '/apartment_building_facilities', to: 'apartment_buildings#facilities', as: 'apt_bd_fac'

  get '/facilities/:id_1/:id_2', to: 'facilities#edit', as: 'facilities' 
  get '/facilities/:id', to: 'facilities#show', as: 'facility' 
  patch '/facilities/:id', to:'facilities#update'
  put '/facilities/:id', to:'facilities#update'

  post '/invoices', to: 'invoices#create', as: 'invoices'

end
