class AddDiscountToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :discount, :integer
  end
end
