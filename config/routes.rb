Rails.application.routes.draw do
  #resources :comments
  devise_for :users
  resources :links do
    member do
      put 'like' => 'links#like'
      put 'dislike' => 'links#dislike'
    end
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'links#index'
end
