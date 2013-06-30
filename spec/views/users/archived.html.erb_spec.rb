require 'spec_helper'

describe "users/archived" do
  before(:each) do
    @bookmark = FactoryGirl.create(:bookmark)
    @bookmark.update_attribute(:pending, false)
    assign(:user, @bookmark.user)
    render
  end

  it "renders resource's address" do
    expect(rendered).to match(@bookmark.resource.link)
  end
end
