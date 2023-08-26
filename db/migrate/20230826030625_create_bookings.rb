class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :service_provider, null: false, foreign_key: { to_table: :users }
      t.references :dog_owner, null: false, foreign_key: { to_table: :users }
      t.boolean :confirmed
      t.float :booking_price

      t.timestamps
    end
  end
end
