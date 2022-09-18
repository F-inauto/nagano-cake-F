Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    resources :genres
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :orders
  end
  namespace :admin do
    resources :order_ditails
  end


  root to: 'homes#top'
  get '/about' => "homes#about"

  resources :addresses
  resources :orders
  resources :cart_items
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
  }
  # 管理者用
  # URL /admin/sign_in ...
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
  }

end
