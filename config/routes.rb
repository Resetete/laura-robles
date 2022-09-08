Rails.application.routes.draw do
  devise_for :admins

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'pages#home'

    resources :about_contents
  end
end
