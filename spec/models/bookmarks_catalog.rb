describe BookmarkCatalog do
  let(:user) { FactoryGirl.create(:user) }
  subject { BookmarkCatalog.new(user) }

  it "#bookmarks_descending" do
    first = FactoryGirl.create(:bookmark, user: user, created_at: 2.day.ago)
    second =FactoryGirl.create(:bookmark, user: user, created_at: 1.day.ago)
    subject.stub(:distance_of_time_in_words_to_now).and_return("1 ago", "2 ago")

    bookmarks = subject.descending

    expect(bookmarks.count).to be(2)
    expect(bookmarks["1 ago"]).to eq [second]
    expect(bookmarks["2 ago"]).to eq [first]
  end

  it "#bookmarks_ascending" do
    first = FactoryGirl.create(:bookmark, user: user, created_at: 2.day.ago)
    second = FactoryGirl.create(:bookmark, user: user, created_at: 1.day.ago)
    subject.stub(:distance_of_time_in_words_to_now).and_return("2 ago", "1 ago")

    bookmarks = subject.ascending

    expect(bookmarks.count).to be(2)
    expect(bookmarks["2 ago"]).to eq [first]
    expect(bookmarks["1 ago"]).to eq [second]
  end
end
