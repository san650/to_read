require 'spec_helper'

describe Snippet do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:raw) }
  it { should validate_presence_of(:user) }

  it "builds from string" do
    user = FactoryGirl.build(:user)
    raw_text = <<-EOT
    This is the title

    This is an example
    EOT

    snippet = Snippet.build_from_text(raw_text, user)

    expect(snippet.raw).to eq(raw_text)
    expect(snippet.title).to eq("This is the title")
    expect(snippet.html).to eq("<p>This is an example</p>\n")
    expect(snippet.user).to eq(user)
  end
end
