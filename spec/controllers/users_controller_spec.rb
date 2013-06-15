require 'spec_helper'

describe UsersController do
  describe "GET show" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it "assigns the requested user as @user" do
      get :show, { name: @user.name }
      assigns(:user).should eq(@user)
    end

    it "returns 200 when the user name exists" do
      get :show, { name: @user.name }
      expect(response).to be_success
    end

    it "returns 404 if the user name doesn't exists" do
      get :show, { name: "non_existant_user" }
      expect(response.status).to eq(404)
    end
  end
end
