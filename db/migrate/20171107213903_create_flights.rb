class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.references :from_airport, index: true
      t.references :to_airport, index: true
      t.datetime :departure_date

      t.timestamps
    end
  end
end
