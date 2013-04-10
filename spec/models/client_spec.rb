# == Schema Information
#
# Table name: clients
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  company_name :string(255)
#  title        :string(255)
#  email        :string(255)
#  website      :string(255)
#  user_id      :integer
#  address      :string(255)
#  city         :string(255)
#  state        :string(255)
#  zip          :string(255)
#  phone        :string(255)
#  office_phone :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Client do
  pending "add some examples to (or delete) #{__FILE__}"
end
