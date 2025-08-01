Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    resources :tournaments
    root :to => "home#index"
    resources :users
    post 'users/new_user' => 'users#new_user'
    get 'users/:id/change_password_yourself' => 'users#change_password_yourself', as: 'change_password'
    get 'tournaments/:id/generate_calendar' => 'tournaments#generate_calendar', as: 'generate_calendar'
    resources :teams
    resources :articles
    resources :announcements
    resources :statistics
    resources :calendars
    resources :players
    resources :games
    resources :game_details
    get 'calendars/get_teams_by_tournament/:team_id' => 'calendars#get_teams_by_tournament', as: 'teams_by_tournament'

    match "/404", to: "errors#not_found", via: :all
    match "/500", to: "errors#internal_server_error", via: :all
  end
end
