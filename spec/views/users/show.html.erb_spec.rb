require 'spec_helper'

describe "users/show" do
  before(:each) do
    @bookmark = FactoryGirl.create(:bookmark)
    assign(:user, @bookmark.user)
    render
  end

  it "renders resource's address" do
    expect(rendered).to match(@bookmark.resource.link)
  end

  it "renders archive link" do
    expect(rendered).to match("Archive")
  end
end
