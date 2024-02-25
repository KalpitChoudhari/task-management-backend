Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "api/v1/sessions", registrations: "api/v1/registrations" }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do 
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        post "sign_out", to: "sessions#destroy"
      end

      resources :tasks
    end
  end
end
