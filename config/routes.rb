Rails.application.routes.draw do
  
  devise_for :users
  
  root :to => "home#index" 
    
  resources :music_albums do
    resources :songs
  end
  
end
