require 'spec_helper'

describe "resources/_resource" do
  before(:each) do
    @resource = FactoryGirl.build(:resource)

    render partial: "resources/resource", locals: { resource: @resource }
  end

  it "renders resource's address" do
    expect(rendered).to match(@resource.link)
  end

  it "renders resource's created date" do
    expect(rendered).to match("about 1 year")
  end

  it "renders resource's description" do
    expect(rendered).to match("Lorem ipsum dolor")
  end
end
