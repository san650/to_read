require "spec_helper"

describe "layouts/_navbar" do
  before(:each) do
    controller.stub(:current_user).and_return(stub("user", :name => "john"))
    render
  end

  it "renders main nav" do
    expect(rendered).to match("Add")
    expect(rendered).to match("Me")
    expect(rendered).to match("Newests")
    expect(rendered).to match("Archived")
  end
end
