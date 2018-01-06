class AddPayedToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :payed, :boolean, default: false
  end
end
