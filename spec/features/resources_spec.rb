require 'spec_helper'

feature "Resources" do
  before(:each) do
    sign_in_with_john
  end

  scenario "User adds a resource" do
    visit "/"

    fill_in "resource_link", with: <<-EOT
    http://www.google.com/
    Google search engine
    EOT

    click_button "Add"

    expect(page).to have_text("Resource was successfully created.")

    visit "/john"

    expect(page).to have_css('a[href="http://www.google.com/"]')
    expect(page).to have_text("Google search engine")
  end
end
