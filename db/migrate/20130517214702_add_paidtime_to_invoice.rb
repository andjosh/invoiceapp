class AddPaidtimeToInvoice < ActiveRecord::Migration
  def change
  	add_column :invoices, :paid_at, :datetime
  end
end
