require 'spec_helper'

describe Resource do
  it 'should have a valid factory' do
    FactoryGirl.create(:google).should be_valid
  end

  it { should validate_presence_of :link }

  it 'should trim link' do
    resource = Resource.create(link: ' http://www.google.com/ ')
    resource.link.should == 'http://www.google.com/'
  end

  context '#create' do
    before do
      @user = FactoryGirl.create(:user)
    end

    it 'should assign link to all users' do
      FactoryGirl.create(:google).save!
      @user.bookmarks.count.should == 1
    end
  end
end
