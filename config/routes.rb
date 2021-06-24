Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
         root to: "home#index"
  resources :product_category_headings do
    resources :product_categories 
  end
      get '/product_categories', to: "product_categories#index"
      get '/product_lists', to: "product_lists#index"
      get '/product_category_headings/:id/product_lists', to: "product_lists#product_list"
    resources :product_categories do 
      resources :product_lists
    end
end
