Rails.application.routes.draw do
  root 'employees/homes#top'
  get 'hoge', to:'employees/homes#top', as:'piyopiyo'
  namespace :admins do
    get get "top" => "homes#top"
  end
  
  namespace :employees do
    get "top" => "homes#top"
    get "about" => "homes#about", as:"about"
    resources :posts
    resources :stores
    resources :vendors
  end
  
  devise_for :employees, controllers: {
        registrations: "employees/registrations",
        sessions: "employees/sessions"
      }
  devise_for :admins, controllers: {
        sessions: "admins/sessions"
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
