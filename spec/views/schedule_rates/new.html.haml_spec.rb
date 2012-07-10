require 'spec_helper'

describe "schedule_rates/new" do
  before(:each) do
    assign(:schedule_rate, stub_model(ScheduleRate).as_new_record)
  end

  it "renders new schedule_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => schedule_rates_path, :method => "post" do
    end
  end
end
