require "spec_helper"

describe UsersController do
  describe "routing" do
    it "/john routes to #show" do
      get("/john").should route_to("users#show", :name => "john")
    end

    it "/john/desc routes to #show" do
      get("/john/desc").should route_to("users#show", :name => "john", :order => "desc")
    end
  end
end
