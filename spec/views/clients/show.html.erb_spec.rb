require 'spec_helper'

describe "clients/show" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Company Name/)
    rendered.should match(/Title/)
    rendered.should match(/Email/)
    rendered.should match(/Website/)
    rendered.should match(/1/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip/)
    rendered.should match(/Phone/)
    rendered.should match(/Office Phone/)
  end
end
