require 'spec_helper'

describe "roster_dates/index" do
  before(:each) do
    assign(:roster_dates, [
      stub_model(RosterDate,
        :employee_id => 1
      ),
      stub_model(RosterDate,
        :employee_id => 1
      )
    ])
  end

  it "renders a list of roster_dates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
