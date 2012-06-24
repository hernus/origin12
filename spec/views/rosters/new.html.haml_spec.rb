require 'spec_helper'

describe "rosters/new" do
  before(:each) do
    assign(:roster, stub_model(Roster).as_new_record)
  end

  it "renders new roster form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rosters_path, :method => "post" do
    end
  end
end
