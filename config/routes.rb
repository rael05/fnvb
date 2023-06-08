Rails.application.routes.draw do
  resources :tournaments

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :users
    root :to => "home#index"

  end

end
