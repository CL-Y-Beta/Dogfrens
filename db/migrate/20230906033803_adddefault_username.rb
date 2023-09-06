class AdddefaultUsername < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :username, :string, default: 'dogfren(00)'
  end
end
