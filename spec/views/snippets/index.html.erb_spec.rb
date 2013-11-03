require 'spec_helper'

describe "snippets/index" do
  it "renders a list of snippets" do
    @snippets = [
      FactoryGirl.build(:snippet, title: "Dummy title", html: "Dummy body")
    ]

    render

    expect(response).to have_text("Dummy title")
    expect(response).to have_text("Dummy body")
  end
end
