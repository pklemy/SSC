Rails.application.routes.draw do
  root 'employees/homes#top'
  get 'hoge', to:'employees/homes#top', as:'piyopiyo'
  namespace :admins do
    get 'homes/top'
  end
  
  namespace :employees do
    get 'homes/top'
    resources :posts
    resources :stores
  end
  
  devise_for :employees, controllers: {
        sessions: 'employees/sessions'
      }
  devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
