require 'spec_helper'

describe "planned_holidays/index" do
  before(:each) do
    assign(:planned_holidays, [
      stub_model(PlannedHoliday,
        :user => nil,
        :approver => nil,
        :holiday_type => nil
      ),
      stub_model(PlannedHoliday,
        :user => nil,
        :approver => nil,
        :holiday_type => nil
      )
    ])
  end

  it "renders a list of planned_holidays" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
