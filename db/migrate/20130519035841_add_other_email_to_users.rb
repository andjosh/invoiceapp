class AddOtherEmailToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :email_paypal, :string
  end
end
