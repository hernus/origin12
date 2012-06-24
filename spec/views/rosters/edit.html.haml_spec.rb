require 'spec_helper'

describe "rosters/edit" do
  before(:each) do
    @roster = assign(:roster, stub_model(Roster))
  end

  it "renders the edit roster form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rosters_path(@roster), :method => "post" do
    end
  end
end
