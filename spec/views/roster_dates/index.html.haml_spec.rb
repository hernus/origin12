require 'spec_helper'

describe "roster_dates/index" do
  before(:each) do
    assign(:roster_dates, [
      stub_model(RosterDate),
      stub_model(RosterDate)
    ])
  end

  it "renders a list of roster_dates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
