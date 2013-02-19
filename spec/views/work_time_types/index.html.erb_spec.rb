require 'spec_helper'

describe "work_time_types/index" do
  before(:each) do
    assign(:work_time_types, [
      stub_model(WorkTimeType,
        :name => "Name"
      ),
      stub_model(WorkTimeType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of work_time_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
