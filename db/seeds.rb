# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
Airport.destroy_all

Airport.create!(code:  "JFK",
                full_name: "John F. Kennedy International Airport")

Airport.create!(code:  "SFO",
                full_name: "San Francisco International Airport")

Airport.create!(code:  "CDG",
                full_name: "Charles de Gaulle Airport")

Airport.create!(code:  "FRA",
                full_name: "Germany Frankfurt Airport")

Flight.destroy_all
airports = Airport.all
10.times do
  airports.each do |origin|
    airports.each do |destination|
      next if origin.id == destination.id
      origin.departing_flights.create!(to_airport_id: destination.id,
        departure_date: Faker::Date.between(Date.today, 1.year.from_now))
    end
  end
end
