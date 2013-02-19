require 'spec_helper'

describe "time_frames/edit" do
  before(:each) do
    @time_frame = assign(:time_frame, stub_model(TimeFrame,
      :name => "MyString",
      :work_site => nil
    ))
  end

  it "renders the edit time_frame form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => time_frames_path(@time_frame), :method => "post" do
      assert_select "input#time_frame_name", :name => "time_frame[name]"
      assert_select "input#time_frame_site", :name => "time_frame[site]"
    end
  end
end
