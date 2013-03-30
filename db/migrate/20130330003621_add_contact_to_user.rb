class AddContactToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :company_name, :string
  	add_column :users, :address, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :zip, :string
  	add_column :users, :phone, :string
  	add_column :users, :office_phone, :string
  end
end
