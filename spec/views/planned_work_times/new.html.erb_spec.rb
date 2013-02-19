require 'spec_helper'

describe "planned_work_times/new" do
  before(:each) do
    assign(:planned_work_time, stub_model(PlannedWorkTime,
      :user => nil,
      :time_frame => nil
    ).as_new_record)
  end

  it "renders new planned_work_time form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => planned_work_times_path, :method => "post" do
      assert_select "input#planned_work_time_user", :name => "planned_work_time[user]"
      assert_select "input#planned_time_sheet_frame", :name => "planned_work_time[time_frame]"
    end
  end
end
