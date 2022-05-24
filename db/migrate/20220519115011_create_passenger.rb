class CreatePassenger < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.references :user, null:false, foreign_key: {to_table: :users}
      t.references :flight, null:false, foreign_key: {to_table: :flights}
      t.integer :flightRow
      t.integer :flightColumn
      t.timestamps
    end
  end
end
