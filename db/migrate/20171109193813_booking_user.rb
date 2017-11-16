class BookingUser < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :booking, index: true
    end
  end
end
