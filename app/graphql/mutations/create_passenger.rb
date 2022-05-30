class Mutations::CreatePassenger < GraphQL::Schema::Mutation

  null true

  argument :passenger, Types::PassengerInputType, required: true

  def resolve(passenger:)
    Passenger.create passenger.to_h
  end

end
