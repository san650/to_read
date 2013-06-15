def sign_in_with_john
  user = FactoryGirl.create(:user)
  FactoryGirl.create(:bookmark, user: user)

  visit "/users/sign_in"
  fill_in "Email", with: "john@example.org"
  fill_in "Password", with: "password for john"
  click_on "Sign in"
end
