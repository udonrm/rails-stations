Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do 
    resources :movies do 
      resources :schedules, only: [:new, :create]
    end
    resources :schedules, except: [:new, :create]
  end

  resources :movies, only: [:index, :show]
  resources :sheets, only: [:index]
end
