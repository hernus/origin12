require 'spec_helper'

describe "roster_dates/new" do
  before(:each) do
    assign(:roster_date, stub_model(RosterDate).as_new_record)
  end

  it "renders new roster_date form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roster_dates_path, :method => "post" do
    end
  end
end
