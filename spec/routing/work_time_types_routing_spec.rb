require "spec_helper"

describe WorkTimeTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/work_time_types").should route_to("work_time_types#index")
    end

    it "routes to #new" do
      get("/work_time_types/new").should route_to("work_time_types#new")
    end

    it "routes to #show" do
      get("/work_time_types/1").should route_to("work_time_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/work_time_types/1/edit").should route_to("work_time_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/work_time_types").should route_to("work_time_types#create")
    end

    it "routes to #update" do
      put("/work_time_types/1").should route_to("work_time_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/work_time_types/1").should route_to("work_time_types#destroy", :id => "1")
    end

  end
end
