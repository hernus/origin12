require 'spec_helper'

describe "roster_dates/new" do
  before(:each) do
    assign(:roster_date, stub_model(RosterDate,
      :employee_id => 1
    ).as_new_record)
  end

  it "renders new roster_date form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roster_dates_path, :method => "post" do
      assert_select "input#roster_date_employee_id", :name => "roster_date[employee_id]"
    end
  end
end
