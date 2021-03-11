Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :promotions, only: %i[index show new create] do
    member do
      post 'generate_coupons'
      post 'approve'
    end
  end

  resources :coupons, only: [:index] do
    post 'inactivate', on: :member
    get 'search', on: :collection
  end

  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :coupons, only: [:show]
    end
  end

end
