Rails.application.routes.draw do
  #管理者
  namespace :admin do
    resources orders,only:[:show,:update]
  end
  namespace :admin do
    resources customers,only:[:show,:index,:edit,:update]
  end
  namespace :admin do
    resources genres,only:[:index,:edit,:create,:update]
  end
  namespace :admin do
    resources items,only:[:index,:show,:edit,:new,:create,:update]
  end
  namespace :admin do
    get '/admin' => 'homes#top'
  end
  
  #会員
  namespace :public do
    resources addresses,only:[:index,:edit,:create,:update,:destroy]
  end
  namespace :public do
    resource customers,only:[:show,:edit,:update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
  end
  namespace :public do
    resources cart_items,only:[:index,:update,:create]
    delete 'cart_items/:id' => 'cart_items#destroy'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  namespace :public do
    resource orders,only:[:new,:index,:show,:create]
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirmation' => 'orders#confirmation'
  end
  namespace :public do
    root to: 'homes/top'
    get 'homes/about' => 'homes#about'
  end
  namespace :public do
    resources items,only:[:index,:show]
  end
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
