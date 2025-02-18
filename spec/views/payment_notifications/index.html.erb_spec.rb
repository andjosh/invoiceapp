require 'spec_helper'

describe "payment_notifications/index" do
  before(:each) do
    assign(:payment_notifications, [
      stub_model(PaymentNotification,
        :params => "MyText",
        :invoice_id => 1,
        :status => "Status",
        :transaction_id => "Transaction",
        :create => "Create"
      ),
      stub_model(PaymentNotification,
        :params => "MyText",
        :invoice_id => 1,
        :status => "Status",
        :transaction_id => "Transaction",
        :create => "Create"
      )
    ])
  end

  it "renders a list of payment_notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Transaction".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
  end
end
