Rails.application.routes.draw do
  devise_for :admins

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'pages#home'
    get 'imprint', to: 'pages#imprint'

    resources :about_contents
    delete '/about_contents/:id', to: 'about_contents#destroy', as: 'destroy_about_contents'

    resources :news_contents
    delete '/news_contents/:id', to: 'news_contents#destroy', as: 'destroy_news_contents'

    resources :project_contents
    delete '/project_contents/:id', to: 'project_contents#destroy', as: 'destroy_project_contents'
  end
end
