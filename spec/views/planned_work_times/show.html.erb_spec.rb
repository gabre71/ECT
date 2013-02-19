require 'spec_helper'

describe "planned_work_times/show" do
  before(:each) do
    @planned_work_time = assign(:planned_work_time, stub_model(PlannedWorkTime,
      :user => nil,
      :time_frame => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
