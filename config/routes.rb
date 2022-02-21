Rails.application.routes.draw do
  
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
  #管理者
  namespace :admin do
    get '/' => 'homes#top'
    resources :orders, only: [:show,:update]
    resources :customers, only: [:show,:index,:edit,:update]
    resources :genres, only: [:index,:edit,:create,:update]
    resources :items, only: [:index,:show,:edit,:new,:create,:update]
    resources :order_details, only: [:update]
  end
  
  #会員
  scope module: :public do
    root to: 'homes#top'
    get 'customer/my_page' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'    
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy'
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirm' => 'orders#confirm'    
    get 'homes/about' => 'homes#about'
    resources :addresses, only: [:index,:edit,:create,:update,:destroy]
    resource :customers, only: [:edit,:update]
    resources :cart_items, only: [:index,:update,:create]
    resources :orders, only: [:new,:index,:show,:create]
    resources :items, only: [:index,:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
