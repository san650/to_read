require 'spec_helper'

describe UsersController do
  describe "GET show" do
    it "assigns the requested user as @user" do
      user = User.create!({ name: 'My String' })
      get :show, {name: 'My String'.to_param}
      assigns(:user).should eq(user)
    end
  end
end
