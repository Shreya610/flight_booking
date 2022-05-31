class FlightsController < ApplicationController
 def index
  @flights=Flight.all  
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

  redirect_to "/flights"
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
  redirect_to "/flights"
 end
 def bookingDelete
  Flight.destroy_by(PNR:params["deletePnr"])
  redirect_to "/flights"
 end

end

