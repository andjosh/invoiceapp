class Item < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :rate, :count

  belongs_to :category 
end
