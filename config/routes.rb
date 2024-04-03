Rails.application.routes.draw do
  
  
  namespace :admins do
  get 'homes/top'
  end
  
  namespace :employees do
  get "homes/top" 
  resources :posts, except: [:new, :edit]
  end
  
  devise_for :employees, controllers: {
        sessions: 'employees/sessions'
      }
  devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
