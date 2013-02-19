require 'spec_helper'

describe "time_frames/new" do
  before(:each) do
    assign(:time_frame, stub_model(TimeFrame,
      :name => "MyString",
      :work_site => nil
    ).as_new_record)
  end

  it "renders new time_frame form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => time_frames_path, :method => "post" do
      assert_select "input#time_frame_name", :name => "time_frame[name]"
      assert_select "input#time_frame_site", :name => "time_frame[site]"
    end
  end
end
