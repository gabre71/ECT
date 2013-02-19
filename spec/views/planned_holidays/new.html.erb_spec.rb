require 'spec_helper'

describe "planned_holidays/new" do
  before(:each) do
    assign(:planned_holiday, stub_model(PlannedHoliday,
      :user => nil,
      :approver => nil,
      :holiday_type => nil
    ).as_new_record)
  end

  it "renders new planned_holiday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => planned_holidays_path, :method => "post" do
      assert_select "input#planned_holiday_user", :name => "planned_holiday[user]"
      assert_select "input#planned_holiday_approver", :name => "planned_holiday[approver]"
      assert_select "input#planned_holiday_holiday_type", :name => "planned_holiday[holiday_type]"
    end
  end
end
