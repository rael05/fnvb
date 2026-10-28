Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, skip: [:registrations]
    resources :tournaments do
      member do
        patch :enable_change
      end
    end
    #patch 'tournaments/:id/enable_change' => 'application#enable_change', as: 'enable_change_tournament'

    root :to => "home#index"
    get 'users/new_user' => 'users#new', as: :new_user_form
    resources :users do
      member do
        patch :enable_change
      end
    end
    post 'users/new_user' => 'users#new_user'
    get 'users/:id/change_password_yourself' => 'users#change_password_yourself', as: 'change_password'
    get 'tournaments/:id/generate_calendar' => 'tournaments#generate_calendar', as: 'generate_calendar'
    resources :teams do
      member do
        patch :enable_change
      end
    end
    resources :articles do
      member do
        patch :enable_change
      end
    end
    resources :announcements do
      member do
        patch :enable_change
      end
    end
    resources :statistics do
      member do
        patch :enable_change
      end
    end
    resources :calendars do
      member do
        patch :enable_change
      end
    end
    resources :players do
      member do
        patch :enable_change
      end
    end
    resources :games do
      member do
        patch :enable_change
      end
    end
    resources :game_details do
      member do
        patch :enable_change
      end
    end
    resources :albums do
      member do
        patch :enable_change
      end
    end
    get 'calendars/get_teams_by_tournament/:team_id' => 'calendars#get_teams_by_tournament', as: 'teams_by_tournament'
    get 'players/:id/get_players' => 'players#get_players', as: 'get_players'
    post 'games/game_details' => 'games#game_details', as: 'save_game_details'

    match "/404", to: "errors#not_found", via: :all, as: :not_found
    match "/500", to: "errors#internal_server_error", via: :all
  end
end
