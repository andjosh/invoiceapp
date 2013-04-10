# == Schema Information
#
# Table name: contracts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contract < ActiveRecord::Base
  # attr_accessible :title, :body
end
