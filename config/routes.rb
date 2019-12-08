Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    # comments are nested resources of articles
    resources :comments
  end

  root 'welcome#index'
end
