require 'spec_helper'

describe "sites/show" do
  before(:each) do
    @work_site = assign(:work_site, stub_model(WorkSite,
      :name => "Name",
      :distance => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
