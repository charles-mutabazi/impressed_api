Rails.application.routes.draw do
  resources :visits, except: [:new, :edit]
  resources :users, except: [:new, :edit]
  devise_for :admins, :controllers => {:sessions => 'sessions'}
  resources :places, except: [:new, :edit] do
    resources :reviews, except: [:new, :edit]
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'places#index'
end
