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

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
