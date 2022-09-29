Rails.application.routes.draw do
  devise_for :admins

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'pages#home'

    resources :about_contents
    delete '/about_contents/:id', to: 'about_contents#destroy', as: 'destroy_about_contents'
  end
end
