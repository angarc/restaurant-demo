Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  scope :admin do
    get '/', to: 'admin#index'
  end

  resources :menu_items, only: [:show]

  namespace :admin do
    resources :menu_item_categories do
      resources :menu_items
    end
  end
end
