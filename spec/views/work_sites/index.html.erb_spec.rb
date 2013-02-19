require 'spec_helper'

describe "sites/index" do
  before(:each) do
    assign(:work_sites, [
      stub_model(WorkSite,
        :name => "Name",
        :distance => 1
      ),
      stub_model(WorkSite,
        :name => "Name",
        :distance => 1
      )
    ])
  end

  it "renders a list of work_sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
