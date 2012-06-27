require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :key => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path(@company), :method => "post" do
      assert_select "input#company_key", :name => "company[key]"
      assert_select "input#company_name", :name => "company[name]"
    end
  end
end
