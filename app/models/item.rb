class Item < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :rate, :count, :invoice_id ,:date ,:total

  belongs_to :category 
  belongs_to :invoice

end
