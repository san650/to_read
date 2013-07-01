require "spec_helper"

describe "layouts/application" do
  before do
    view.stub(:user_signed_in?)
    view.stub(:current_user)
  end

  it "renders the amount of pending resources in page title" do
    view.should_receive(:title)
    render
  end
end
