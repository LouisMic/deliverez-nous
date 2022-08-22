class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :seller, :boolean, default: false
    add_column :users, :address, :string
  end
end
