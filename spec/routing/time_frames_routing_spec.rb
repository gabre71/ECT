require "spec_helper"

describe TimeFramesController do
  describe "routing" do

    it "routes to #index" do
      get("/time_frames").should route_to("time_frames#index")
    end

    it "routes to #new" do
      get("/time_frames/new").should route_to("time_frames#new")
    end

    it "routes to #show" do
      get("/time_frames/1").should route_to("time_frames#show", :id => "1")
    end

    it "routes to #edit" do
      get("/time_frames/1/edit").should route_to("time_frames#edit", :id => "1")
    end

    it "routes to #create" do
      post("/time_frames").should route_to("time_frames#create")
    end

    it "routes to #update" do
      put("/time_frames/1").should route_to("time_frames#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/time_frames/1").should route_to("time_frames#destroy", :id => "1")
    end

  end
end
