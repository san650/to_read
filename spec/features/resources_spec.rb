require 'spec_helper'

feature "Resources" do
  before(:each) do
    @user = sign_in_with(:john)
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
    FactoryGirl.create(:bookmark, :user => @user)

    click_link "Me"

    expect(page).to have_css('a[href="http://www.example.org/"]')
    expect(page).to have_text("Lorem ipsum dolor")

    click_on "Archive"

    expect(page).not_to have_text("Lorem ipsum dolor")
  end

  scenario "List bookmarks order by date" do
    FactoryGirl.create(:bookmark,
        :user => @user,
        :created_at => 1.second.ago,
        :resource => FactoryGirl.build(:resource_one_second_ago))
    FactoryGirl.create(:bookmark,
        :user => @user,
        :created_at => 10.seconds.ago,
        :resource => FactoryGirl.build(:resource_ten_seconds_ago))

    click_link "Me"
    expect(page.text).to match(/ten seconds ago link.*one second ago link/)

    click_link "Newests"
    expect(page.text).to match(/one second ago link.*ten seconds ago link/)
  end
end
