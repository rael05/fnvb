Rails.application.routes.draw do
  resources :calendars

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    resources :tournaments
    root :to => "home#index"
    resources :users
    post 'users/new_user' => 'users#new_user'
    resources :teams
    resources :articles
    resources :announcements
    resources :statistics
  end

end
