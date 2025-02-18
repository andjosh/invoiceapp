require 'spec_helper'

describe "payment_notifications/edit" do
  before(:each) do
    @payment_notification = assign(:payment_notification, stub_model(PaymentNotification,
      :params => "MyText",
      :invoice_id => 1,
      :status => "MyString",
      :transaction_id => "MyString",
      :create => "MyString"
    ))
  end

  it "renders the edit payment_notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payment_notifications_path(@payment_notification), :method => "post" do
      assert_select "textarea#payment_notification_params", :name => "payment_notification[params]"
      assert_select "input#payment_notification_invoice_id", :name => "payment_notification[invoice_id]"
      assert_select "input#payment_notification_status", :name => "payment_notification[status]"
      assert_select "input#payment_notification_transaction_id", :name => "payment_notification[transaction_id]"
      assert_select "input#payment_notification_create", :name => "payment_notification[create]"
    end
  end
end
