require 'spec_helper'

describe "teams/show" do
  before(:each) do
    @team = assign(:team, stub_model(Team,
      :key => "Key",
      :parent_id => 1,
      :manager_id => 2,
      :description => "Description",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Key/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Description/)
    rendered.should match(/State/)
  end
end
