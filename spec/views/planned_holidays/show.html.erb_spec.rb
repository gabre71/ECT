require 'spec_helper'

describe "planned_holidays/show" do
  before(:each) do
    @planned_holiday = assign(:planned_holiday, stub_model(PlannedHoliday,
      :user => nil,
      :approver => nil,
      :holiday_type => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
