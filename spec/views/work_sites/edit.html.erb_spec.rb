require 'spec_helper'

describe "sites/edit" do
  before(:each) do
    @work_site = assign(:work_site, stub_model(WorkSite,
      :name => "MyString",
      :distance => 1
    ))
  end

  it "renders the edit work_sites form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => work_sites_path(@work_site), :method => "post" do
      assert_select "input#site_name", :name => "site[name]"
      assert_select "input#site_distance", :name => "site[distance]"
    end
  end
end
