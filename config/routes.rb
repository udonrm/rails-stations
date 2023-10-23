Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do 
    resources :movies, only: [:index, :new, :create, :edit, :update]
  end

  resources :movies, only: [:index]
end
