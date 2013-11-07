require 'spec_helper'

describe ResourcesController do
  before do
    sign_in FactoryGirl.create(:user)
  end

  let(:valid_attributes) do
    { "resource" => { "link" => "dummy text" } }
  end

  describe "POST create" do
    it "creates a new Resource" do
      expect {
        post :create, valid_attributes
      }.to change(Resource, :count).by(1)
    end

    it "assigns a newly created resource as @resource" do
      post :create, valid_attributes

      expect(assigns(:resource)).to be_a(Resource)
      expect(assigns(:resource)).to be_persisted
    end

    it "redirects to home action" do
      post :create, valid_attributes

      expect(response).to redirect_to(root_path)
    end

    it "creates bookmarks for all users" do
      User.should_receive(:assign_resource_to_everyone).and_call_original
      post :create, valid_attributes
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved resource as @resource" do
        Resource.any_instance.stub(:save).and_return(false)
        post :create, {:resource => { "link" => "" }}

        expect(assigns(:resource)).to be_a_new(Resource)
      end

      it "re-renders the 'new' template" do
        Resource.any_instance.stub(:save).and_return(false)
        post :create, {:resource => { "link" => "" }}

        expect(response).to render_template("home/index")
      end
    end
  end
end
