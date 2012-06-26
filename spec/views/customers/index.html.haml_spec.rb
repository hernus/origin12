require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :key => "Key",
        :name => "Name",
        :company_id => "Company"
      ),
      stub_model(Customer,
        :key => "Key",
        :name => "Name",
        :company_id => "Company"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
