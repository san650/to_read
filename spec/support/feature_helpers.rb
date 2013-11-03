require "spec_helper"
include Warden::Test::Helpers

module FeatureHelpers
  def sign_in_with(user_name)
    user = FactoryGirl.create(user_name)
    login_as(user)
    user
  end

  def sign_out
    logout
  end
end
