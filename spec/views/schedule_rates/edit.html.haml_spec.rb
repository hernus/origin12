require 'spec_helper'

describe "schedule_rates/edit" do
  before(:each) do
    @schedule_rate = assign(:schedule_rate, stub_model(ScheduleRate))
  end

  it "renders the edit schedule_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => schedule_rates_path(@schedule_rate), :method => "post" do
    end
  end
end
