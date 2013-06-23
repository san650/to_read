require 'spec_helper'

feature "Resources" do
  before(:each) do
    sign_in_with(:john)
    visit "/"
  end

  scenario "User adds a resource" do
    fill_in "resource_link", with: <<-EOT
    http://www.google.com/
    Google search engine
    EOT

    click_button "Add"

    expect(page).to have_text("Resource was successfully created.")

    click_link "Me"

    expect(page).to have_css('a[href="http://www.google.com/"]')
    expect(page).to have_text("Google search engine")
  end

  scenario "User archives a resource" do
    click_link "Me"

    expect(page).to have_css('a[href="http://www.example.org/"]')
    expect(page).to have_text("Lorem ipsum dolor")

    click_on "Archive"

    expect(page).not_to have_text("Lorem ipsum dolor")
  end
end
