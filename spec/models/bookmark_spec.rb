require 'spec_helper'

describe Bookmark do
  it "gets bookmarks sorted by date desc" do
    first = FactoryGirl.create(:bookmark, created_at: 2.day.ago)
    second = FactoryGirl.create(:bookmark, created_at: 1.day.ago)

    bookmarks = Bookmark.descending

    expect(bookmarks.length).to eq 2
    expect(bookmarks[0]).to eq second
    expect(bookmarks[1]).to eq first
  end

  it "gets bookmarks sorted by date asc" do
    first = FactoryGirl.create(:bookmark, created_at: 2.day.ago)
    second = FactoryGirl.create(:bookmark, created_at: 1.day.ago)

    bookmarks = Bookmark.ascending

    expect(bookmarks.length).to eq 2
    expect(bookmarks[0]).to eq first
    expect(bookmarks[1]).to eq second
  end
end
