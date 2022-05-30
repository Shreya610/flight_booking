# frozen_string_literal: true

module Types
  class PassengerType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :flight_id, Integer, null: false
    field :flightRow, Integer
    field :flightColumn, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end


class Types::PassengerInputType < GraphQL::Schema::InputObject
  graphql_name "PassengerInputType"
  description "All the attributes needed to create/update an passenger"

  argument :id, ID, required: false
  argument :user_id, Integer, required: false
  argument :flight_id, Integer, required: false
  argument :flightRow, Integer, required: false
  argument :flightColumn, Integer, required: false

end

