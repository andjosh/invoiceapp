# == Schema Information
#
# Table name: invoices
#
#  id            :integer          not null, primary key
#  client_id     :integer
#  user_id       :integer
#  rand          :string(255)
#  title         :string(255)
#  description   :text
#  number        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  paid          :boolean          default(FALSE)
#  taxed         :boolean          default(FALSE)
#  travel        :float
#  previous_paid :float
#  materials     :float
#  other         :float
#

require 'spec_helper'

describe Invoice do
  pending "add some examples to (or delete) #{__FILE__}"
end
