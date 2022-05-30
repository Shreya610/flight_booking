# frozen_string_literal: true

module Types
  class FlightType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :PNR, String
    field :origin, String
    field :destination, String
    field :dateOfFlight, String
    field :category, String
    field :basePrice, Float
    field :numberOfRows, Integer
    field :seatsInRow, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end

end


class Types::FlightInputType < GraphQL::Schema::InputObject
  graphql_name "FlightInputType"
  description "All the attributes needed to create/update an flight"

  argument :id, ID, required: false
  argument :name, String, required: false
  argument :PNR, String, required: false
  argument :origin, String, required: false
  argument :destination, String, required: false
  argument :dateOfFlight, String, required: false
  argument :category, String, required: false
  argument :basePrice, Float, required: false
  argument :numberOfRows, Integer, required: false
  argument :seatsInRow, Integer, required: false

end

