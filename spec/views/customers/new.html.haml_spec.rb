require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :key => "MyString",
      :name => "MyString",
      :company_id => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path, :method => "post" do
      assert_select "input#customer_key", :name => "customer[key]"
      assert_select "input#customer_name", :name => "customer[name]"
      assert_select "input#customer_company_id", :name => "customer[company_id]"
    end
  end
end
