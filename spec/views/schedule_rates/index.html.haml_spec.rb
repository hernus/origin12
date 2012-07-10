require 'spec_helper'

describe "schedule_rates/index" do
  before(:each) do
    assign(:schedule_rates, [
      stub_model(ScheduleRate),
      stub_model(ScheduleRate)
    ])
  end

  it "renders a list of schedule_rates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
