require 'spec_helper'

feature "Users" do
  before(:each) do
    FactoryGirl.create(:user, name: "john")
    FactoryGirl.create(:bookmark)
  end

  scenario "User views list of resources" do
    visit "/john"

    expect(page).to have_text("http://www.example.org/")
  end
end