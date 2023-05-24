Rails.application.routes.draw do
  root "flats#index"
  resources :flats, except: [:index, :new]
end
