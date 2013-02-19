require 'spec_helper'

describe "time_sheets/index" do
  before(:each) do
    assign(:time_sheets, [
      stub_model(TimeSheet,
        :user => nil,
        :time_frame => nil,
        :work_site => nil,
        :end_time => "",
        :lateness => false,
        :holiday => false
      ),
      stub_model(TimeSheet,
        :user => nil,
        :time_frame => nil,
        :work_site => nil,
        :end_time => "",
        :lateness => false,
        :holiday => false
      )
    ])
  end

  it "renders a list of time_sheets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
