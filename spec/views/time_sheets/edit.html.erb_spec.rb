require 'spec_helper'

describe "time_sheets/edit" do
  before(:each) do
    @time_sheet = assign(:time_sheet, stub_model(TimeSheet,
      :user => nil,
      :time_frame => nil,
      :work_site => nil,
      :end_time => "",
      :lateness => false,
      :holiday => false
    ))
  end

  it "renders the edit time_sheet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => time_sheets_path(@time_sheet), :method => "post" do
      assert_select "input#time_sheet_user", :name => "time_sheet[user]"
      assert_select "input#time_sheet_time_frame", :name => "time_sheet[time_frame]"
      assert_select "input#time_sheet_site", :name => "time_sheet[site]"
      assert_select "input#time_sheet_end_time", :name => "time_sheet[end_time]"
      assert_select "input#time_sheet_lateness", :name => "time_sheet[lateness]"
      assert_select "input#time_sheet_holiday", :name => "time_sheet[holiday]"
    end
  end
end
