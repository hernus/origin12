require 'spec_helper'

describe "roster_dates/show" do
  before(:each) do
    @roster_date = assign(:roster_date, stub_model(RosterDate,
      :employee_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
