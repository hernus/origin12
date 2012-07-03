require 'spec_helper'

describe "roster_dates/edit" do
  before(:each) do
    @roster_date = assign(:roster_date, stub_model(RosterDate))
  end

  it "renders the edit roster_date form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roster_dates_path(@roster_date), :method => "post" do
    end
  end
end
