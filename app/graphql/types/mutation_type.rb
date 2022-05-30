module Types
  class MutationType < Types::BaseObject


    field :create_passenger, Types::PassengerType, mutation: Mutations::CreatePassenger

    field :update_passenger, Boolean, null: false, description: "Update an passenger" do
      argument :passenger, Types::PassengerInputType, required: true
    end

    def update_passenger(passenger:)
      existing = Passenger.where(id: passenger[:id]).first
      existing&.update passenger.to_h
    end

    field :delete_passenger, Boolean, null: false, description: "Delete an passenger" do
      argument :id, ID, required: true
    end

    def delete_passenger(id:)
      Passenger.where(id: id).destroy_all
      true
    end

    field :create_flight, Types::FlightType, mutation: Mutations::CreateFlight

    field :update_flight, Boolean, null: false, description: "Update an flight" do
      argument :flight, Types::FlightInputType, required: true
    end

    def update_flight(flight:)
      existing = Flight.where(PNR: flight[:PNR]).first
      existing&.update flight.to_h
    end

    field :delete_flight, Boolean, null: false, description: "Delete an flight" do
      argument :id, ID, required: true
    end

    def delete_flight(id:)
      Flight.where(id: id).destroy_all
      true
    end


  end
end
