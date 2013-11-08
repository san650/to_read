require 'spec_helper'

describe "users/show" do
  it "renders the date" do
    @catalog = { "dummy date" => [] }
    render

    expect(rendered).to match("dummy date")
  end
end
