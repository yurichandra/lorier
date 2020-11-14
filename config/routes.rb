Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'index#index'

  resources :stations, only: %i[index create]

  resources :consignees, only: %i[index show create]

  resources :shippers, only: %i[index show create]

  resources :shipments, only: %i[create]
end
