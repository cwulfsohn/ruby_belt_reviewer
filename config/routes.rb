Rails.application.routes.draw do
  root 'events#index'
  get 'events/:id' => 'events#show'
  get 'events/edit/:id' => 'events#edit'
  post 'events' => 'events#create'
  patch 'events/update/:id' => 'events#update'
  delete 'events/destroy/:id' => 'events#destroy'
  post 'events/attendee/:event_id/:user_id' => 'events#join'
  delete 'events/attendee/:event_id/:user_id' => 'events#leave'
  post 'comment/:event_id/:user_id' => 'comments#create'


  get 'users' => 'users#new'
  post 'users' => 'users#create'
  post 'login' => 'users#login'
  get 'users/:id' => 'users#show'
  delete 'users' => 'users#destroy'
  patch 'users/update/:id' => 'users#update'
  delete 'logout' => 'users#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
