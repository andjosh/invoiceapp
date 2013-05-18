# == Schema Information
#
# Table name: payment_notifications
#
#  id             :integer          not null, primary key
#  params         :text
#  invoice_id     :integer
#  status         :string(255)
#  transaction_id :string(255)
#  create         :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PaymentNotification < ActiveRecord::Base
  attr_accessible :create, :invoice_id, :params, :status, :transaction_id

  belongs_to :invoice
	serialize :params
	after_create :mark_invoice_as_paid

	private

	def mark_invoice_as_paid
	  if status == "Completed" && params[:receiver_email] == invoice.client.email && params[:mc_currency] == "USD"
	    invoice.update_attribute(:paid_at, Time.now)
	    invoice.update_attribute(:paid, true)
	  end
	end

end
