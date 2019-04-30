Rails.application.routes.draw do
  devise_for :businesses, path: 'businesses', controllers: { sessions: "businesses/sessions"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions"}




  root "welcomes#index"
  get '/', to: "welcomes#index"
  get "/products", to: "products#index", as: "products"
  post "/products", to: "products#create"
  get "/products/new", to: "products#new", as: "new_product"
  get "/products/:id", to: "products#show", as: "product"
  put "/products/:id", to: "products#update"
  patch "/products/:id", to: "products#update"
  get "/products/:id/edit", to: "products#edit", as: "edit_product"
  delete "/products/:id", to: "products#delete"
  get "/business_dashboard", to:"welcomes#business_dashboard"
  get "/user_dashboard", to:"welcomes#people_dashboard"

  get "/login", to:"welcomes#login"
  get "/signup", to:"welcomes#signup"




end
