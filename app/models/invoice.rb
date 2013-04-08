class Invoice < ActiveRecord::Base
  attr_accessible :description, :number, :rand, :client_id, :user_id, :title, :paid

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
