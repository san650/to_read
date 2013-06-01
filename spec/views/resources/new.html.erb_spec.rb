require 'spec_helper'

describe "resources/new" do
  before(:each) do
    assign(:resource, stub_model(Resource,
      :link => "MyString"
    ).as_new_record)
  end

  it "renders new resource form" do
    render

    assert_select "form[action=?][method=?]", resources_path, "post" do
      assert_select "textarea#resource_link[name=?]", "resource[link]"
    end
  end
end
