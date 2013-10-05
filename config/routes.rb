Blogger3::Application.routes.draw do

root to: 'offres#index'

resources :author_sessions, only: [ :new, :create, :destroy ]

 get 'login'  => 'author_sessions#new'
 get 'logout' => 'author_sessions#destroy'


 


 resources :profils
 resources :offres
 resources :tags


resources :profils do
  resources :comments
   resources :offres
end


resources :authors do
 	resources :comments
 end



 end

