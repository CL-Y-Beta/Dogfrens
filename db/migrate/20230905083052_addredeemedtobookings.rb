class Addredeemedtobookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :redeemed, :boolean
  end
end
