require 'spec_helper'

describe "work_time_types/show" do
  before(:each) do
    @work_time_type = assign(:work_time_type, stub_model(WorkTimeType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
