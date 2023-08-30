class ChangeListingColumnNullConstraints < ActiveRecord::Migration[7.0]
  def change
    change_column_null :listings, :price, false
    change_column_null :listings, :discount, false
  end
end
