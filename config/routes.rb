Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root :to => "users#new"
   patch 'edit_seat', to: 'sessions#editSeat'
   patch 'edit_booking', to: 'sessions#editBooking'
   delete 'delete_passenger', to: 'sessions#deletePassenger'

   resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'welcomeAdmin', to: 'sessions#admin'
   get 'loginAdmin', to: 'sessions#login'
   post 'loginAdmin', to: 'sessions#adminlogin'
   get 'flights' , to: 'sessions#welcome'
   get 'user_flights', to: 'sessions#flight'
   post 'bookings', to: 'sessions#bookings'
   get 'signup', to: 'users#new'
   patch 'bookings_edit', to: 'sessions#bookingEdit'
   delete 'bookings_delete', to: 'sessions#bookingDelete'
   post 'passenger', to: 'sessions#passenger'
   post 'signup', to: 'users#create'
   get 'admin', to: 'users#index'
   post 'admin', to: 'users#signup'
  # Defines the root path route ("/")
  # root "articles#index"
end
