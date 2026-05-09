Rails.application.routes.draw do
  devise_for :recruiters
  devise_for :job_seekers
  resources :jobs do
    member do
      patch :apply
    end
  end

  get "dashboard", to: "dashboards#index"
  get "welcomes/register" => "welcomes#register"
  root to: "welcomes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
