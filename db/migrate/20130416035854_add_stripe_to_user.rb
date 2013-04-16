class AddStripeToUser < ActiveRecord::Migration
  def change
  	add_column :users, :str_uid, :string
  	add_column :users, :str_token, :string
  	add_column :users, :str_pub, :string
  end
end
