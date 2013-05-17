class AddQualToUser < ActiveRecord::Migration
  def change
  	add_column :users, :experience, :float
  end
end
