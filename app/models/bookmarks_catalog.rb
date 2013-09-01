class BookmarkCatalog
  include ActionView::Helpers::DateHelper

  def initialize(user)
    @user = user
  end

  def descending
    group_by_date(@user.bookmarks.descending)
  end

  def ascending
    group_by_date(@user.bookmarks.ascending)
  end

  private

  def group_by_date(bookmarks)
    catalog = Hash.new {|hash,key| hash[key] = [] }
    bookmarks.inject(catalog) do |group,elem|
      group[distance_of_time_in_words_to_now(elem.created_at)] << elem
      group
    end

    catalog
  end
end
