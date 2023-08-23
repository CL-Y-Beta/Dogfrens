class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.integer :quantity_left
      t.timestamps
    end
  end
end
