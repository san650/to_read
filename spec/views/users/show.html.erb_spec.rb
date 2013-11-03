require 'spec_helper'

describe "users/show" do
  before(:each) do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:bookmark, user: user)
    @catalog = BookmarksCatalog.new(user).descending

    render
  end

  it "renders resource's address" do
    expect(rendered).to match("http://www.example.org/")
  end

  it "renders archive link" do
    expect(rendered).to match("Archive")
  end
end
