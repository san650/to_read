require 'spec_helper'

describe SnippetsController do
  before do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET index" do
    it "assigns all user's snippets as @snippets" do
      user = FactoryGirl.create(:user)
      snippet = FactoryGirl.create(:snippet, user: user)

      get :index, { "name" => user.name }

      expect(assigns(:snippets)).to eq([snippet])
    end

    it "does not assigns other users snippets" do
      john = FactoryGirl.create(:user)
      snippet = FactoryGirl.create(:snippet, user: john)
      mary = FactoryGirl.create(:user)

      get :index, { "name" => mary.name }

      expect(assigns(:snippets)).to be_empty
    end

    it "raises an error when user doesn't exists" do
      expect {
        get :index, { "name" => "non-existant-user" }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:valid_attributes) do
        { snippet: { "raw" => "lorem ipsum dolor" } }
      end

      it "creates a new Snippet" do
        expect {
          post :create, valid_attributes
        }.to change(Snippet, :count).by(1)
      end

      it "assigns a newly created snippet as @snippet" do
        post :create, valid_attributes

        expect(assigns(:snippet)).to be_a(Snippet)
        expect(assigns(:snippet)).to be_persisted
      end

      it "redirects to the created snippet" do
        post :create, valid_attributes

        expect(response).to redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved snippet as @snippet" do
        Snippet.any_instance.stub(:save).and_return(false)

        post :create, { snippet: { "raw" => "invalid value" } }

        expect(assigns(:snippet)).to be_a_new(Snippet)
      end

      it "re-renders the 'new' template" do
        Snippet.any_instance.stub(:save).and_return(false)

        post :create, { snippet: { "raw" => "invalid value" } }

        expect(response).to render_template("home/index")
      end
    end
  end
end
