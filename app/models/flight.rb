class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"


    def self.accurate_flights(from_id, to_id)
      self.where("from_airport_id = ? AND to_airport_id = ?", from_id, to_id)
    end

end
