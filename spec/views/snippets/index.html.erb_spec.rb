require 'spec_helper'

describe "snippets/index" do
  it "renders a list of snippets" do
    snippet = FactoryGirl.build(:snippet, title: "Dummy title", html: "Dummy body")
    snippet.id = 10
    @snippets = [
      snippet
    ]

    render

    expect(response).to have_text("Dummy title")
    expect(response).to have_text("Dummy body")
    expect(response).to match('<a name="snippet_10" href="#snippet_10">')
  end
end
