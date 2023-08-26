class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.references :listing, null: false, foreign_key: true
      t.integer :percentage

      t.timestamps
    end
  end
end
