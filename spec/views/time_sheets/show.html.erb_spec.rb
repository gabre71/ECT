require 'spec_helper'

describe "time_sheets/show" do
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

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
