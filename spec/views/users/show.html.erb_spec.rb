require 'spec_helper'

describe "users/show" do
  before(:each) do
    @bookmark = FactoryGirl.create(:bookmark)
    @user = assign(:user, @bookmark.user)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(@bookmark.resource.link)
  end
end
