class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :company_name
      t.string :title
      t.string :email
      t.string :website
      t.integer :user_id
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :office_phone

      t.timestamps
    end
  end
end
