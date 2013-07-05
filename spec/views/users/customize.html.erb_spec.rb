require 'spec_helper'

describe "users/customize" do
  before(:each) do
    user = FactoryGirl.create(:user, custom_javascript: "custom javascript")
    view.stub(:current_user).and_return(user)
    render
  end

  it "renders textarea with default content" do
    expect(rendered).to have_content("custom javascript")
  end
end
