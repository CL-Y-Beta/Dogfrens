class AddRedeemDescriptionToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :redeem_description, :text
  end
end
