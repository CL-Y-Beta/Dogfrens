class AddColumnstoUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :mobile, :integer
    add_column :users, :address, :string
    add_column :users, :description, :string
    add_column :users, :password, :string
  end
end
