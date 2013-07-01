module ApplicationHelper
  def title(user)
    return "ToRead" unless user
    count = user.bookmarks.count
    if count > 0
      "[#{count}] ToRead"
    else
      "ToRead"
    end
  end
end
