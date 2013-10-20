require "spec_helper"

describe AecDataController do
  describe "routing" do

    it "routes to #index" do
      get("/aec_data").should route_to("aec_data#index")
    end

    it "routes to #new" do
      get("/aec_data/new").should route_to("aec_data#new")
    end

    it "routes to #show" do
      get("/aec_data/1").should route_to("aec_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aec_data/1/edit").should route_to("aec_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aec_data").should route_to("aec_data#create")
    end

    it "routes to #update" do
      put("/aec_data/1").should route_to("aec_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aec_data/1").should route_to("aec_data#destroy", :id => "1")
    end

  end
end
