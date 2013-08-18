require 'spec_helper'

describe Resource do
  it 'should have a valid factory' do
    FactoryGirl.create(:google).should be_valid
  end

  it { should validate_presence_of :link }

  it "trims link" do
    resource = Resource.create(link: ' http://www.google.com/ ')

    expect(resource.link).to eq("http://www.google.com/")
  end

  it "builds from string" do
    resource = Resource.build_from_text(
      <<-EOT
      http://www.example.org/

      This is an example
      EOT
    )

    expect(resource.link).to eq("http://www.example.org/")
    expect(resource.description).to eq("This is an example")
    expect(resource.description_html).to eq("<p>This is an example</p>\n")
  end
end
