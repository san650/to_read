require 'spec_helper'

feature "Resources" do
  scenario "User adds a new resource" do
    visit "/resources/new"

    fill_in "resource_link", with: " http://www.google.com/ "
    click_button "Add"

    expect(page).to have_text("Resource was successfully created.")
  end
end
