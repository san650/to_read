require "spec_helper"

describe BookmarksController do
  before do
    @bookmark = FactoryGirl.build(:bookmark)
    @bookmark.save!

    sign_in @bookmark.user
  end

  describe "PUT archive" do
    it "redirects to the user bookmarks" do
      put :archive, { :id => "1" }
      response.should redirect_to(user_url(@bookmark.user.name))
    end

    it "updates the requested bookmark" do
      Bookmark.any_instance.should_receive(:update_attribute).with(:pending, false)
      put :archive, { :id => @bookmark.id }
    end
  end
end
