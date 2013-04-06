class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :name
    	t.float :count
    	t.float :rate
    	t.integer :category_id
    	t.string :description

      t.timestamps
    end
  end
end
