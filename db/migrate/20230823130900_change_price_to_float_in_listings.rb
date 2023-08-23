class ChangePriceToFloatInListings < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up { change_column :listings, :price, :float }
      dir.down { change_column :listings, :price, :integer }
    end
  end
end
