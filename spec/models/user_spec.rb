require 'spec_helper'

describe User do
  it 'should have a valid factory' do
    FactoryGirl.create(:user).should be_valid
  end

  it "returns not pending resources" do
    user = FactoryGirl.create(:user_with_bookmark)
    user.bookmarks.first.update_attribute(:pending, false)
    user.reload

    user.bookmarks.should be_empty
  end
end
