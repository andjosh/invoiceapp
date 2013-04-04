class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :client_id
      t.integer :user_id
      t.string :rand
      t.string :title
      t.text :description
      t.integer :number

      t.timestamps
    end
    add_index :invoices, :rand
    add_index :invoices, :client_id
    add_index :invoices, :user_id
  end
end
