require 'spec_helper'

describe UsersController do
  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET show" do
    it "assigns catalog" do
      get :show, { name: @user.name }
      assigns(:catalog).should be_true
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

  describe "GET archived" do
    it "assigns the requested user as @user" do
      get :archived, { name: @user.name }
      assigns(:user).should eq(@user)
    end

    it "returns 200 when the user name exists" do
      get :archived, { name: @user.name }
      expect(response).to be_success
    end

    it "returns 404 if the user name doesn't exists" do
      get :archived, { name: "non_existant_user" }
      expect(response.status).to eq(404)
    end
  end

  describe "GET customize" do
    it "returns 200" do
      get :customize
      expect(response).to be_success
    end
  end
end
