class SessionsController < ApplicationController
 def admin
  @flights=Flight.all  
 end
 def create
   @user = User.find_by(email: params[:email])
   if @user
      session[:user_id] = @user.id
      redirect_to '/welcome'
   else
      redirect_to '/login'
   end
 end
 def adminlogin
   @user = User.find_by(email: params[:email])
   if @user
      session[:user_id] = @user.id
      redirect_to '/welcomeAdmin'
   else
      redirect_to '/loginAdmin'
   end
 end

 def welcome
    @flight = Flight.new
    
    @origins=Flight.distinct.all.pluck(:origin)
    @destinations=Flight.distinct.all.pluck(:destination)
    @from=@origins[0]
    @to=@destinations[0]
    if !params[:flight].nil?
         redirect_to "/user_flights"
    end

 end
 def flight
  @flights=Flight.where(origin: params["flight"]["origin"],destination: params["flight"]["destination"])
  
  query="SELECT k.flight_id,u.name,u.PNR, u.origin,u.destination,u.dateOfFlight,u.category,u.basePrice,u.numberOfRows,u.seatsInRow,k.flightRow,k.flightColumn FROM flights as u LEFT JOIN passengers as k on u.id=k.flight_id where k.user_id=#{current_user.id}"
  @passengers = ActiveRecord::Base.connection.execute(query)
  puts @passengers



 end
 def bookings
  puts params["pnr"]
  flight=Flight.new
  if params["firstClassBasePrice"]!=""
   flight.name=params["name"]
   flight.PNR=params["firstClassPnr"]
   flight.origin=params["origin"]
   flight.destination=params["destination"]
   flight.dateOfFlight=params["dateOfFlight"]
  
   flight.category="First Class"
   flight.basePrice=params["firstClassBasePrice"]
   flight.numberOfRows=params["firstClassNumberOfRows"]
   flight.seatsInRow=params["firstClassSeatsInRow"]
  
   flight.save
  end
  flight=Flight.new
  if params["businessClassBasePrice"]!=""
   flight.name=params["name"]
   flight.PNR=params["businessClassPnr"]
   flight.origin=params["origin"]
   flight.destination=params["destination"]
   flight.dateOfFlight=params["dateOfFlight"]
  
   flight.category="Business Class"
   flight.basePrice=params["businessClassBasePrice"]
   flight.numberOfRows=params["businessClassNumberOfRows"]
   flight.seatsInRow=params["businessClassSeatsInRow"]
  
   flight.save
  end
  flight=Flight.new
  if params["economyClassBasePrice"]!=""
   flight.name=params["name"]
   flight.PNR=params["economyClassPnr"]
   flight.origin=params["origin"]
   flight.destination=params["destination"]
   flight.dateOfFlight=params["dateOfFlight"]
  
   flight.category="First Class"
   flight.basePrice=params["economyClassBasePrice"]
   flight.numberOfRows=params["economyClassNumberOfRows"]
   flight.seatsInRow=params["economyClassSeatsInRow"]
  
   flight.save
  end

  redirect_to "/welcomeAdmin"
 end
 def bookingEdit

  flight = Flight.find_by(PNR:params["updatePnr"])
  flight.name=params["updateName"]
  flight.PNR=params["updatePnr"]
  flight.origin=params["updateOrigin"]
  flight.destination=params["updateDestination"]
  if params["updateDateOfFlight"]!=""
   flight.dateOfFlight=params["updateDateOfFlight"]
  end
  flight.basePrice=params["updateBasePrice"]
  flight.numberOfRows=params["updateNumberOfRows"]
  flight.seatsInRow=params["updateSeatsInRow"]

  flight.save
  redirect_to "/welcomeAdmin"
 end
 def bookingDelete
  Flight.destroy_by(PNR:params["deletePnr"])
  redirect_to "/welcomeAdmin"
 end

 def passenger
  flight = Flight.find_by(PNR:params["pnr"])

  puts params
  passenger=Passenger.new
  passenger.flightRow=params["flightRow"]
  passenger.flightColumn=params["flightColumn"]
  passenger.user_id=current_user.id
  passenger.flight_id=flight.id
  passenger.save
  redirect_to "/welcome"
 end
 def editSeat
  puts params
  passenger = Passenger.find_by(flight_id:params["updateFlightId"])
  passenger.flightRow=params["updateFlightRow"]
  passenger.flightColumn=params["updateFlightColumn"]
  passenger.save
  redirect_to "/welcome"
 end
 def editBooking
 
  flight = Flight.find_by(PNR:params["bookingPnr"])
  passenger=Passenger.find_by(flight_id: params["bookingFlightId"])
  passenger.flight_id=flight.id
  passenger.save
  redirect_to "/welcome"
  
 end
 def deletePassenger
  Passenger.destroy_by(flight_id:params["flightId"])
  redirect_to "/welcome"

 end
end

