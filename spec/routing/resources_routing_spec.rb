require "spec_helper"

describe ResourcesController do
  describe "routing" do
    it "routes to #create" do
      post("/resources").should route_to("resources#create")
    end
  end
end
