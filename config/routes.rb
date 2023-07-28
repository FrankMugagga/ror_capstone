Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'homes#splash', as: :unauthenticated_root
     
    end
  end

  resources :categories do
    resources :expenses 
  end

  post 'categories/create', to: 'categories#create', as: :categories_create
  post  'categories/:category_id/expenses', to: 'expenses#create', as: :expenses_create
end