require 'spec_helper'

describe "planned_work_times/index" do
  before(:each) do
    assign(:planned_work_times, [
      stub_model(PlannedWorkTime,
        :user => nil,
        :time_frame => nil
      ),
      stub_model(PlannedWorkTime,
        :user => nil,
        :time_frame => nil
      )
    ])
  end

  it "renders a list of planned_work_times" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
