class PassengersController < ApplicationController

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

