Rails.application.routes.draw do
   if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
   end
   post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root 'registrations#index'
   patch 'edit_seat', to: 'passengers#editSeat'
   patch 'edit_booking', to: 'passengers#editBooking'
   delete 'delete_passenger', to: 'passengers#deletePassenger'

   resources :users, only: [:new, :create]
   get 'welcome', to: 'passengers#welcome'

   get 'flights' , to: 'passengers#welcome'
   get 'user_flights', to: 'passengers#flight'
   post 'bookings', to: 'flights#bookings'
   patch 'bookings_edit', to: 'flights#bookingEdit'
   delete 'bookings_delete', to: 'flights#bookingDelete'
   post 'passenger', to: 'passengers#passenger'

   get 'flights', to: 'flights#index'


   get 'login', to: 'sessions#index'
   post 'login', to: 'sessions#index'
   get 'loginAdmin', to: 'sessions#admin'
   post 'loginAdmin', to: 'sessions#admin'

   get 'signup', to: 'registrations#index'
   post 'signup', to: 'registrations#index'
   get 'admin', to: 'registrations#admin'
   post 'admin', to: 'registrations#admin'
  # Defines the root path route ("/")
  # root "articles#index"
end
