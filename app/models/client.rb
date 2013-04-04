class Client < ActiveRecord::Base
  attr_accessible :address, :city, :company_name, :email, :name, :office_phone, :phone, :state, :title, :user_id, :website, :zip

  belongs_to :user
  has_many :invoices

  def to_param
    "#{id} #{name}".parameterize
  end

end
