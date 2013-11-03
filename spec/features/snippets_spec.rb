require "spec_helper"

feature "Snippets" do
  before do
    sign_in_with(:john)
    visit "/"
  end

  scenario "John adds a new snippet" do
    # create a new snippet
    within ".new_snippet" do
      fill_in "snippet_raw", with: <<-EOT
      This is my dummy snippet

      What an awesome snippet
      EOT

      click_button "Add"
    end

    expect(page).to have_text("Snippet was successfully created.")

    # view the new snippet in the snippets list
    click_link "Snippets"

    expect(page).to have_text("This is my dummy snippet")
    expect(page).to have_text("What an awesome snippet")

    sign_out
    sign_in_with(:mary)

    # mary views john snippets
    visit "/john/snippets"

    expect(page).to have_text("This is my dummy snippet")
    expect(page).to have_text("What an awesome snippet")

    # mary's snippet list is empty
    click_link "Snippets"

    expect(page).not_to have_content("This is my dummy snippet")
    expect(page).not_to have_content("What an awesome snippet")
  end

  scenario "johns fails on adding a new snippet" do
    within ".new_snippet" do
      click_button "Add"
    end

    expect(page).to have_text("")
  end
end
