class Invoice < ActiveRecord::Base
  attr_accessible :description, :number, :rand, :client_id, :user_id, :title, :paid

  validates :rand, :uniqueness => true
  belongs_to :user
  belongs_to :client
  has_many :items

  scope :paid, where("paid = ?", true)

  def to_param
    "#{rand}".parameterize
  end

end
