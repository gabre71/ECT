require 'spec_helper'

describe "work_time_types/edit" do
  before(:each) do
    @work_time_type = assign(:work_time_type, stub_model(WorkTimeType,
      :name => "MyString"
    ))
  end

  it "renders the edit work_time_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => work_time_types_path(@work_time_type), :method => "post" do
      assert_select "input#work_time_type_name", :name => "work_time_type[name]"
    end
  end
end
