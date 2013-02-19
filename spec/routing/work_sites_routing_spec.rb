require "spec_helper"

describe WorkSitesController do
  describe "routing" do

    it "routes to #index" do
      get("/work_sites").should route_to("sites#index")
    end

    it "routes to #new" do
      get("/work_sites/new").should route_to("sites#new")
    end

    it "routes to #show" do
      get("/work_sites/1").should route_to("sites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/work_sites/1/edit").should route_to("sites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/work_sites").should route_to("sites#create")
    end

    it "routes to #update" do
      put("/work_sites/1").should route_to("sites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/work_sites/1").should route_to("sites#destroy", :id => "1")
    end

  end
end
