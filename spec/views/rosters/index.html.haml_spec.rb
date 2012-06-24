require 'spec_helper'

describe "rosters/index" do
  before(:each) do
    assign(:rosters, [
      stub_model(Roster),
      stub_model(Roster)
    ])
  end

  it "renders a list of rosters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
