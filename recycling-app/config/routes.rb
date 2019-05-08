Rails.application.routes.draw do
  devise_for :admins, paths: 'admins', controllers: { sessions: "businesses/sessions"}
  devise_for :businesses, path: 'businesses', controllers: { sessions: "businesses/sessions", registrations: "businesses/registrations"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations"}

  root "welcomes#index"
  resources :transactions
  resources :charges
  # resources :products
  get '/', to: "welcomes#index"

  get "/products", to: "products#index", as: "products"
  get "/businesses/registrations/error", to: "welcomes#error"


  post "/products", to: "products#create"
  get "/products/new", to: "products#new", as: "new_product"
  get "/products/:id", to: "products#show", as: "product"

  put "/products/:id", to: "products#update"
  patch "/products/:id", to: "products#update"
  get "/products/:id/edit", to: "products#edit", as: "edit_product"
  delete "/products/:id", to: "products#delete"
  get "/business_dashboard", to:"welcomes#business_dashboard"
  get "/user_dashboard", to:"welcomes#people_dashboard"
  post "/products/new", to:"products#new"

  get "/login", to:"welcomes#login"
  get "/signup", to:"welcomes#signup"
  get "/my_dashboard", to:"welcomes#people_dashboard"
  get "/users", to: "welcomes#people_dashboard"

  post "/products/filtered/category", to: "products#filter_cat"
  post "/products/filtered/location", to: "products#filter_loc"
  get "/admin", to: "welcomes#admin_dashboard"
end
