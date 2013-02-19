require 'spec_helper'

describe "work_time_types/new" do
  before(:each) do
    assign(:work_time_type, stub_model(WorkTimeType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new work_time_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => work_time_types_path, :method => "post" do
      assert_select "input#work_time_type_name", :name => "work_time_type[name]"
    end
  end
end
