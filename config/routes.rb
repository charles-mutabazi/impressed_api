Rails.application.routes.draw do
  devise_for :admins, :controllers => {:sessions => 'sessions'}
  
  resources :users, except: [:new, :edit] do
    get 'visits', to: :visits
    get 'place_visits', to: :get_user_visits
    get 'reviews', to: :get_user_reviews
    get 'analytics', to: :get_user_analytics
  end
  
  resources :places, except: [:new, :edit] do
    #get 'reviews', to: :get_place_reviews
    resources :reviews, except: [:new, :edit]
    get 'visits', to: :get_place_visits
  end

  get 'allvisits', to: 'visits#showall'
 
  resources :visits, except: [:new, :edit]
  resources :place_visits, except: [:new, :edit]
  #resources :reviews, except: [:new, :edit]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'places#index'
end
