Rails.application.routes.draw do
  devise_for :employees, controllers: {
        sessions: 'employees/sessions'
      }
  devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
