Rails.application.routes.draw do
  devise_for :users, :path =>'',
  :path_names=>{:sign_in => 'login',:sign_out => 'logout',:edit => "profile"},
  :controllers => {:registrations => 'registrations' }
  root 'pages#home'
  resources :users, only: [:show]
  resources :photos
  resources :rooms , path:'annonces' do
    resources :reviews, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get '/your_trips' => 'reservations#your_trips' , path:'mes_voyages'


end
