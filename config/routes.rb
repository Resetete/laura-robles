Rails.application.routes.draw do
  devise_for :admins

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'pages#home'

    resources :about_contents
    delete '/about_content/:id/destroy', to: 'about_contents#destroy', as: 'destroy_about_content'
  end
end
