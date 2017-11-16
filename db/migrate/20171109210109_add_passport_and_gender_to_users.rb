class AddPassportAndGenderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :passport, :string
    add_column :users, :gender, :string
  end
end
