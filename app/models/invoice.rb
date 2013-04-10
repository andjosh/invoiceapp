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

class Invoice < ActiveRecord::Base
  attr_accessible :description, :number, :rand, :client_id, :user_id, :title, :paid, :items_attributes, :taxed, :travel, :materials, :previous_paid, :other

  validates :rand, :uniqueness => true
  belongs_to :user
  belongs_to :client
  has_many :items

  accepts_nested_attributes_for :items, :allow_destroy => true

  scope :paid, where("paid = ?", true)

  def to_param
    "#{rand}".parameterize
  end

end
