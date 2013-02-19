require 'spec_helper'

describe "time_frames/index" do
  before(:each) do
    assign(:time_frames, [
      stub_model(TimeFrame,
        :name => "Name",
        :work_site => nil
      ),
      stub_model(TimeFrame,
        :name => "Name",
        :work_site => nil
      )
    ])
  end

  it "renders a list of time_frames" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
