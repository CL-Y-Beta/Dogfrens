class BookmarksController < ApplicationController

  ## Need to change this such that it fetches the current_user bookmarks
  def index
    @bookmark = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to_bookmarks_path(@bookmark)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(listing_attributes: [:id], user_attributes: [:id])
  end
end
