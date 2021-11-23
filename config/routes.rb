Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'products#index', as: :authenticated_root
  end
  unauthenticated :user do
    root 'products#splash', as: :unauthenticated_root
  end

  resources :products do
    resources :deals
  end
end
