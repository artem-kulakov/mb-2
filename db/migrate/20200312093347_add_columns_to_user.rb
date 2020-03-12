class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :street, :srting
    add_column :users, :apartment, :string
    add_column :users, :city, :string
    add_column :users, :country, :srting
    add_column :users, :zip, :string
  end
end
