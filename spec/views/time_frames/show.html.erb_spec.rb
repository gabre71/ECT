require 'spec_helper'

describe "time_frames/show" do
  before(:each) do
    @time_frame = assign(:time_frame, stub_model(TimeFrame,
      :name => "Name",
      :work_site => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
