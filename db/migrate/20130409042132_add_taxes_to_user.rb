class AddTaxesToUser < ActiveRecord::Migration
  def change
  	add_column :users, :tax, :float
  end
end
