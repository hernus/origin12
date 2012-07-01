require 'spec_helper'

describe "teams/new" do
  before(:each) do
    assign(:team, stub_model(Team,
      :key => "MyString",
      :parent_id => 1,
      :manager_id => 1,
      :description => "MyString",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teams_path, :method => "post" do
      assert_select "input#team_key", :name => "team[key]"
      assert_select "input#team_parent_id", :name => "team[parent_id]"
      assert_select "input#team_manager_id", :name => "team[manager_id]"
      assert_select "input#team_description", :name => "team[description]"
      assert_select "input#team_state", :name => "team[state]"
    end
  end
end
