class Mutations::CreateFlight < GraphQL::Schema::Mutation

  null true

  argument :flight, Types::FlightInputType, required: true

  def resolve(flight:)
    Flight.create flight.to_h
  end

end
