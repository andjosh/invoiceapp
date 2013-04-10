# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  count       :float
#  rate        :float
#  category_id :integer
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date        :datetime
#  total       :float
#  invoice_id  :integer
#

class Item < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :rate, :count, :invoice_id ,:date ,:total

  belongs_to :category 
  belongs_to :invoice

end
