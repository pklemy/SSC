Rails.application.routes.draw do
  root 'employees/homes#top'
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  devise_for :employees, controllers: {
      registrations: "employees/registrations",
      sessions: "employees/sessions"
  }
  get 'hoge', to:'employees/homes#top', as:'piyopiyo'
  namespace :admins do
    root "homes#top"
    resources :employees, only: [:destroy]
  end
  
  scope module: :employees do
    get "top" => "homes#top"
    get "about" => "homes#about", as:"about"
    resources :posts, only: [:show, :edit, :update, :destroy] do
      resource :good, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
    resources :comments, only: :destroy
    resources :stores do
      member do
        post :invitation
      end
      resources :vendors, only: [:index, :new, :create]
      resources :posts, only: [:index, :new, :create]
      resources :employees, only: [:destroy]
    end
    resources :vendors, only: [:show, :edit, :update, :destroy]
    get "employees/invite_session_new/:store_id", to: "employees#invite_session_new", as: :new_invite_session
    post "employees/invite_session_create/:store_id", to: "employees#invite_session_create", as: :invite_sessions
    get "employees/staff_new/:store_hash", to: "employees#staff_new", as: :new_staff
    post "employees/staff_create/:store_id", to: "employees#staff_create", as: :create_staff
    resources :employees, only: [:show, :edit, :update]
  end
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
