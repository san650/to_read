require "spec_helper"

describe SnippetsController do
  describe "routing" do
    it "routes to #index" do
      get("/john/snippets").should route_to("snippets#index", name: "john")
    end

    it "routes to #create" do
      post("/snippets").should route_to("snippets#create")
    end

    it "routes to #update" do
      put("/snippets/1").should route_to("snippets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/snippets/1").should route_to("snippets#destroy", :id => "1")
    end
  end
end
