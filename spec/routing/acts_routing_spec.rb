require "spec_helper"

describe ActsController do
  describe "routing" do

    it "routes to #index" do
      get("/acts").should route_to("acts#index")
    end

    it "routes to #new" do
      get("/acts/new").should route_to("acts#new")
    end

    it "routes to #show" do
      get("/acts/1").should route_to("acts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/acts/1/edit").should route_to("acts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/acts").should route_to("acts#create")
    end

    it "routes to #update" do
      put("/acts/1").should route_to("acts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/acts/1").should route_to("acts#destroy", :id => "1")
    end

  end
end
