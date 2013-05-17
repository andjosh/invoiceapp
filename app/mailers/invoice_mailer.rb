class InvoiceMailer < ActionMailer::Base
  default from: "no-reply@roninvoice.com"

  def mail_invoice(client, invoice, total)
    @client = client
    @invoice = invoice
    @sender = 'Roninvoice Postmaster'
    @total = total

    mail(to: @client.email, subject: "Invoice from "+@invoice.user.name)
  end

end
