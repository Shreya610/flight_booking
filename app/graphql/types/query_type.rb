module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

  
    field :flights,
    [Types::FlightType],
    null: false, 
    description: "Return a list of flights"
  
    def flights
      Flight.all
    end 
    
    field :passengers,
    [Types::PassengerType],
    null: false,
    description: "Return a list of passengers"

    def passengers
      Passenger.all
    end
    field :flight, Types::FlightType, null: true, description: "Returns one Flight instance"do
      argument :id, ID, required: true
    end

    def flight(id:)
      Flight.where(id: id).first
    end  
    field :passenger, Types::PassengerType, null: true, description: "Returns one Passenger instance"do
      argument :id, ID, required: true
    end

    def passenger(id:)
      Passenger.where(id: id).first
    end
  end



end
