Rails.application.routes.draw do
  root 'welcome#home'
  get('/about', { to: 'welcome#about', as: :about })
  get('/contact_us', { to: 'contacts#index', as: :contact })
  post('/contact_us', { to: 'contacts#create' })
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
