require 'spec_helper'

describe "users/show" do
  before(:each) do
    @bookmark = FactoryGirl.create(:bookmark)
    @user = assign(:user, @bookmark.user)
    render
  end

  it "renders resource's address" do
    expect(rendered).to match(@bookmark.resource.link)
  end

  it "renders resource's created date" do
    expect(rendered).to match("about 1 year")
  end
end
