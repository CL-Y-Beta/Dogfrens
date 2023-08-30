class ChangeUserColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :company_name, :string
    change_column :users, :mobile, :string
    add_column :users, :dog_description, :text
  end
end
