require "spec_helper"

describe ResourcesController do
  describe "routing" do

    it "routes to #new" do
      put("/bookmarks/archive/1").should route_to("bookmarks#archive", :id => "1")
    end
  end
end
