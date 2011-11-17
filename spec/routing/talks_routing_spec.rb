require "spec_helper"

describe TalksController do
  describe "routing" do

    it "routes to #index" do
      get("/talks").should route_to("talks#index")
    end

    it "routes to #new" do
      get("/talks/new").should route_to("talks#new")
    end

    it "routes to #create" do
      post("/talks").should route_to("talks#create")
    end
  end
end
