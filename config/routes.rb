Rails.application.routes.draw do
  
  resources :post_categories

  get 'contact', to: 'contact#index'

  get 'enrolments', to: "enrolments#index"

  resources :feedback_forms do
    member do
      get :satisfaction
      get :achieve
      get :recommend
      get :another
      get :value
    end
  end

  get 'course_enrolments/index'

  resources :testimonials

  resources :pre_questionnaires

  resources :admissions

  root 'home#index'
  get 'blog', to: 'blog#index'
  get 'community', to: 'community#index'
  get 'women-in-tech', to: 'women_in_tech#index'
  resources :scholarships

  resources :authors

  resources :enquiries

  mount Shoppe::Engine => "/store"
  get 'thanks', to: 'thanks#index'
  get 'admin', to: 'admin#index'

  get 'fast-track-application', to: 'fast_track_applications#new'
  resources :fast_track_applications do
    member do 
      get :accept
    end
  end

  resources :partners

  resources :course_registrations

  get 'fast-track', to: 'fast_track#index'

  resources :posts do
    collection { post :import }
  end

  

  get 'privacy', to: 'privacy#index'

  devise_for :users, :skip => :registrations

  # get "/posts/why-their-needs-more-women-in-tech", to: redirect('/posts/why-there-needs-more-women-in-tech')
  # get "/popular_programmes/rails-foundations-for-beginners", to: redirect('/courses/learn-to-code-weekend-workshop')
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Product browising
  #
  get 'courses' => 'products#categories', :as => 'catalogue'
  get 'products/filter' => 'products#filter', :as => 'product_filter'
  get 'courses/:category_id' => 'products#index', :as => 'products'
  get 'courses/:category_id/:product_id' => 'products#show', :as => 'product'
  post 'courses/:category_id/:product_id/buy' => 'products#add_to_basket', :as => 'buy_product'
  # get 'product/:permalink' => 'product#show', :as => 'item'

  #
  # Order status
  #
  get 'order/:token' => 'orders#status', :as => 'order_status'

  #
  # Basket
  #
  get 'basket' => 'orders#show', :as => 'basket'
  delete 'basket' => 'orders#destroy', :as => 'empty_basket'
  post 'basket/:order_item_id' => 'orders#change_item_quantity', :as => 'adjust_basket_item_quantity'
  delete 'basket/:order_item_id' => 'orders#change_item_quantity'
  delete 'basket/delete/:order_item_id' => 'orders#remove_item', :as => 'remove_basket_item'

  #
  # Checkout
  #
  match 'checkout' => 'orders#checkout', :as => 'checkout', :via => [:get, :patch]
  match 'checkout/delivery' => 'orders#change_delivery_service', :as => 'change_delivery_service', :via => [:post]
  match 'checkout/pay' => 'orders#payment', :as => 'checkout_payment', :via => [:get, :post]
  match 'checkout/confirm' => 'orders#confirmation', :as => 'checkout_confirmation', :via => [:get, :patch]
end
