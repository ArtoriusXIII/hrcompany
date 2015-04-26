Rails.application.routes.draw do
  

  resources :region_compensations

  resources :departments

  devise_for :users
  resources :employees do
    resources :accounts
  end

  resources :companies do
    collection { post :import}
  end

 

  get "welcome/index"

  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/faq'

  get 'welcome/pricing'

  get 'welcome/features'
  
 
  
  resources :invoices

  root to: 'welcome#index'
  
end
