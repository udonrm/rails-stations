Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do 
    resources :reservations
    resources :movies do 
      resources :schedules, only: [:new, :create]
    end
    resources :schedules, except: [:new, :create]
  end

  resources :movies, only: [:index, :show] do
    get 'reservation' => 'movies#reservation'
    get 'schedules/:schedule_id/reservations/new' => 'reservations#new', as: 'sheet_reservation'
  end

  post 'reservations' => 'reservations#create'

  resources :sheets, only: [:index]
end
