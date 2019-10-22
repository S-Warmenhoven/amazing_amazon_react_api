Rails.application.routes.draw do
  get "/products/new" => "products#new", as: :new_product
  post "/products" => "products#create", as: :products
  get "/products/:id" => "products#show", as: :product
  get "/products" => "products#index"
  delete "/products/:id" => "products#destroy"
 
  root 'welcome#home'
  get('/about', { to: 'welcome#about', as: :about })
  get('/contact_us', { to: 'contacts#index', as: :contact })
  post('/contact_us', { to: 'contacts#create' })
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
