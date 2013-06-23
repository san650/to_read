require "spec_helper"
include Warden::Test::Helpers

module FeatureHelpers
  def sign_in_with(user_name)
    user = FactoryGirl.create(user_name)
    bookmark = FactoryGirl.build(:bookmark)
    bookmark.user = user
    user.save!

    login_as(user)

    user
  end
end
