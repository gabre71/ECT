require "spec_helper"

describe PlannedHolidaysController do
  describe "routing" do

    it "routes to #index" do
      get("/planned_holidays").should route_to("planned_holidays#index")
    end

    it "routes to #new" do
      get("/planned_holidays/new").should route_to("planned_holidays#new")
    end

    it "routes to #show" do
      get("/planned_holidays/1").should route_to("planned_holidays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/planned_holidays/1/edit").should route_to("planned_holidays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/planned_holidays").should route_to("planned_holidays#create")
    end

    it "routes to #update" do
      put("/planned_holidays/1").should route_to("planned_holidays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/planned_holidays/1").should route_to("planned_holidays#destroy", :id => "1")
    end

  end
end
