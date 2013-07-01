require "spec_helper"

describe ApplicationHelper do
  context "#title" do
    before(:each) do
      @user = double("user", bookmarks: double("bookmarks"))
    end

    it "renders only the title" do
      @user.bookmarks.stub(count: 0)
      expect(title(@user)).to eq "ToRead"
    end

    it "renders the count of unread bookmarks" do
      @user.bookmarks.stub(count: 1)
      expect(title(@user)).to eq "[1] ToRead"
    end
  end
end
