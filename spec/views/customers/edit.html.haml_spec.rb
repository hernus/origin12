require 'spec_helper'

describe "customers/edit" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :key => "MyString",
      :name => "MyString",
      :company_id => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path(@customer), :method => "post" do
      assert_select "input#customer_key", :name => "customer[key]"
      assert_select "input#customer_name", :name => "customer[name]"
      assert_select "input#customer_company_id", :name => "customer[company_id]"
    end
  end
end
