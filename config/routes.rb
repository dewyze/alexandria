Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :stores, except: %i[index destroy]

  namespace :form_fields do
    resources :store_books, only: %i[new]
  end
end
