require 'spec_helper'

describe UsersHelper do
  it "#render_user" do
    expect(render_user(FactoryGirl.build(:user, name: "john"))).
      to eq('<span class="author john">john</span>')
  end
end
