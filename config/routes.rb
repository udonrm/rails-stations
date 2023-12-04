Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :theaters, only: %i[new create]
    resources :screens, only: %i[new create]
    resources :reservations
    resources :movies do
      resources :schedules, only: %i[new create]
    end
    resources :schedules, except: %i[new create]
  end

  resources :movies, only: %i[index show] do
    get 'reservation' => 'movies#reservation'
    get 'schedules/:schedule_id/reservations/new' => 'reservations#new', as: 'sheet_reservation'
  end

  post 'reservations' => 'reservations#create'

  resources :sheets, only: [:index]
end
