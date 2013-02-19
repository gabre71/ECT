require "spec_helper"

describe PlannedWorkTimesController do
  describe "routing" do

    it "routes to #index" do
      get("/planned_work_times").should route_to("planned_work_times#index")
    end

    it "routes to #new" do
      get("/planned_work_times/new").should route_to("planned_work_times#new")
    end

    it "routes to #show" do
      get("/planned_work_times/1").should route_to("planned_work_times#show", :id => "1")
    end

    it "routes to #edit" do
      get("/planned_work_times/1/edit").should route_to("planned_work_times#edit", :id => "1")
    end

    it "routes to #create" do
      post("/planned_work_times").should route_to("planned_work_times#create")
    end

    it "routes to #update" do
      put("/planned_work_times/1").should route_to("planned_work_times#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/planned_work_times/1").should route_to("planned_work_times#destroy", :id => "1")
    end

  end
end
