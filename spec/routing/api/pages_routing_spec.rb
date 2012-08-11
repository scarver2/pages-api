require "spec_helper"

describe Api::PagesController do
  describe "routing" do

    it "routes to #index" do
      get("/api/pages").should route_to("api/pages#index")
    end

    it "routes to #new" do
      get("/api/pages/new").should route_to("api/pages#new")
    end

    it "routes to #show" do
      get("/api/pages/1").should route_to("api/pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/api/pages/1/edit").should route_to("api/pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/api/pages").should route_to("api/pages#create")
    end

    it "routes to #update" do
      put("/api/pages/1").should route_to("api/pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/api/pages/1").should route_to("api/pages#destroy", :id => "1")
    end

  end
end
