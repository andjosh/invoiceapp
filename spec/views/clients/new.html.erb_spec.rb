require 'spec_helper'

describe "clients/new" do
  before(:each) do
    assign(:client, stub_model(Client,
      :name => "MyString",
      :company_name => "MyString",
      :title => "MyString",
      :email => "MyString",
      :website => "MyString",
      :user_id => 1,
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :phone => "MyString",
      :office_phone => "MyString"
    ).as_new_record)
  end

  it "renders new client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path, :method => "post" do
      assert_select "input#client_name", :name => "client[name]"
      assert_select "input#client_company_name", :name => "client[company_name]"
      assert_select "input#client_title", :name => "client[title]"
      assert_select "input#client_email", :name => "client[email]"
      assert_select "input#client_website", :name => "client[website]"
      assert_select "input#client_user_id", :name => "client[user_id]"
      assert_select "input#client_address", :name => "client[address]"
      assert_select "input#client_city", :name => "client[city]"
      assert_select "input#client_state", :name => "client[state]"
      assert_select "input#client_zip", :name => "client[zip]"
      assert_select "input#client_phone", :name => "client[phone]"
      assert_select "input#client_office_phone", :name => "client[office_phone]"
    end
  end
end
