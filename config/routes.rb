Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_ditails
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => "homes#about"
    resources :addresses
    resources :orders do
      post 'order/confirm' => 'orders#confirm'
    end
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
    end
    resources :items
    get 'customers/mypage' => 'customers#show'
    get 'customers/mypage/edit' => 'customers#edit'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end
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
