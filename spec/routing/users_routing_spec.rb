require "spec_helper"

describe UsersController do
  describe "routing" do
    it "routes to #show" do
      get("/john").should route_to("users#show", :name => "john")
    end
  end
end
