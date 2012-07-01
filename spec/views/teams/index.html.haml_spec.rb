require 'spec_helper'

describe "teams/index" do
  before(:each) do
    assign(:teams, [
      stub_model(Team,
        :key => "Key",
        :parent_id => 1,
        :manager_id => 2,
        :description => "Description",
        :state => "State"
      ),
      stub_model(Team,
        :key => "Key",
        :parent_id => 1,
        :manager_id => 2,
        :description => "Description",
        :state => "State"
      )
    ])
  end

  it "renders a list of teams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
