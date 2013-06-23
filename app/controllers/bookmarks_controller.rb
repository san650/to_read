class BookmarksController < ApplicationController

  # PUT /bookmarks/archive/1
  def archive
    bookmark = current_user.bookmarks.find(params[:id])
    bookmark.update_attribute(:pending, false)

    redirect_to user_url(current_user.name)
  end
end
