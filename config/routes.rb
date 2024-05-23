Rails.application.routes.draw do
  devise_for :authentications, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'authentications/sessions',
    registrations: 'authentications/registrations'
  }

  namespace :api do
    get 'audit_logs/index'
    resources :customers do 
      resources :customer_directions, only: [:index, :create, :show, :update, :destroy]
      resources :customer_identifications, only: [:index, :create, :show, :update, :destroy]
    end
    resources :audit_logs, only: [:index]
    get 'generate_client_report', to: 'api#generate_client_report'
  end


  get "up" => "rails/health#show", as: :rails_health_check

end
