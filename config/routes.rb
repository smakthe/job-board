Rails.application.routes.draw do

  devise_for :recruiters
  devise_for :job_seekers
  resources :jobs
  match "apply_job", to: 'jobs#apply', via: :patch
  namespace :dashboard do
    
    authenticated :recruiter do
      get 'profiles/show'
      get 'profiles/edit'
      patch 'profiles/update'
    end

    authenticated :job_seeker do
      get 'profiles/show'
      get 'profiles/edit'
      patch 'profiles/update'
    end

    root to: "dashboard#index"
    

  end
  get 'welcomes/index'
  get 'welcomes/register' => 'welcomes#register'
  root to: 'welcomes#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
