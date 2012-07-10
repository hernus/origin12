require 'spec_helper'

describe "schedule_rates/show" do
  before(:each) do
    @schedule_rate = assign(:schedule_rate, stub_model(ScheduleRate))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
