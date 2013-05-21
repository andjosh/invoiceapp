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
#  paid_at       :datetime
#

class Invoice < ActiveRecord::Base
  attr_accessible :description, :number, :rand, :client_id, :user_id, :title, :paid, :items_attributes, :taxed, :travel, :materials, :previous_paid, :other, :paid_at

  validates :rand, :uniqueness => true
  belongs_to :user
  belongs_to :client
  has_many :items

  accepts_nested_attributes_for :items, :allow_destroy => true

  scope :paid, where("paid = ?", true)

  def to_param
    "#{rand}".parameterize
  end

  def paypal_url(seller, return_url, notify_url)
    values = {
      :business => seller,
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url
    }
    items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.rate,
        "item_name_#{index+1}" => item.name,
        "quantity_#{index+1}" => item.count.to_i
      })
    end
    "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end
