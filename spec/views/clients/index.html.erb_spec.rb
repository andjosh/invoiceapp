require 'spec_helper'

describe "clients/index" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :name => "Name",
        :company_name => "Company Name",
        :title => "Title",
        :email => "Email",
        :website => "Website",
        :user_id => 1,
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :phone => "Phone",
        :office_phone => "Office Phone"
      ),
      stub_model(Client,
        :name => "Name",
        :company_name => "Company Name",
        :title => "Title",
        :email => "Email",
        :website => "Website",
        :user_id => 1,
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :phone => "Phone",
        :office_phone => "Office Phone"
      )
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Office Phone".to_s, :count => 2
  end
end
