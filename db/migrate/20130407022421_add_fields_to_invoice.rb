class AddFieldsToInvoice < ActiveRecord::Migration
  def change
  	add_column :invoices, :taxed, :boolean, :default => false
  	add_column :invoices, :travel, :float
  	add_column :invoices, :previous_paid, :float
  	add_column :invoices, :materials, :float
  	add_column :invoices, :other, :float

  	add_column :items, :date, :datetime
  	add_column :items, :total, :float
  end
end
