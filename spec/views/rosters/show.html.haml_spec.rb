require 'spec_helper'

describe "rosters/show" do
  before(:each) do
    @roster = assign(:roster, stub_model(Roster))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
