require 'spec_helper'

describe User do
  it 'has a valid factory' do
    FactoryGirl.create(:user).should be_valid
  end

  it "returns not pending resources" do
    user = FactoryGirl.create(:user_with_bookmark)
    user.bookmarks.first.update_attribute(:pending, false)

    user.bookmarks.should be_empty
  end

  context '#assign_link_to_everyone' do
    before do
      @user = FactoryGirl.create(:user)
      @resource = FactoryGirl.create(:google)
    end

    it 'should assign link to all users' do
      User.assign_resource_to_everyone(@resource)

      @user.bookmarks.count.should == 1
    end
  end
end
