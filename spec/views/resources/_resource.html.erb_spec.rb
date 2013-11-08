require 'spec_helper'

describe "resources/_resource" do
  before(:each) do
    resource = FactoryGirl.create(:resource)
    bookmark = FactoryGirl.create(:bookmark, resource: resource)

    render partial: "resources/resource", locals: { resource: resource, bookmark: bookmark }
  end

  it "renders resource's address" do
    expect(rendered).to match("http://www.example.org/")
  end

  it "renders resource's description" do
    expect(rendered).to match("<p>Lorem ipsum dolor</p>")
  end

  it "renders archive link" do
    expect(rendered).to match("Archive")
  end
end
