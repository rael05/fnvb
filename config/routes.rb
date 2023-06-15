Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :users
    resources :tournaments
    root :to => "home#index"
    resources :users
    post 'users/new_user' => 'users#new_user'

  end

end
