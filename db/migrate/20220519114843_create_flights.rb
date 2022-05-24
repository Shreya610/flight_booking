class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :PNR
      t.string :origin
      t.string :destination
      t.string :dateOfFlight

      t.string :category
      t.decimal :basePrice
      t.integer :numberOfRows
      t.integer :seatsInRow
      t.timestamps
    end
  end
end
