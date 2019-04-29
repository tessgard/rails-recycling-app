Rails.application.routes.draw do
  # devise_for :users

  root "welcomes#index"

  get "/products", to: "products#index", as: "products"
  post "/products", to: "products#create"
  get "/products/new", to: "products#new", as: "new_product"
  get "/products/:id", to: "products#show", as: "product"

  put "/products/:id", to: "products#update"
  patch "/products/:id", to: "products#update"
  get "/products/:id/edit", to: "products#edit", as: "edit_product"
  delete "/products/:id", to: "products#delete"

  # resources :charges

  
end
