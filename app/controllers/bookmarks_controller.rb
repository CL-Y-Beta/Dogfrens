class BookmarksController < ApplicationController

  ## Need to change this such that it fetches the current_user bookmarks
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
    @bookmark = Bookmark.find(params[id])
  end

  # def create
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @bookmark.listing_id = params[:listing_id]
  #   @bookmark.user_id = params[:user_id]
  #   if @bookmark.save
  #     redirect_to listing_path(@bookmark.listing), notice: 'Bookmark successfully saved'
  #   else
  #     redirect_to listing_path(params[:id]), alert: 'Failed to create bookmark.'
  #   end
  # end

  def create
    @listing = Listing.find(params[:listing_id])
    bookmark_params = { listing_id: @listing.id,
                        user_id: current_user.id }
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to listing_path(@bookmark.listing), notice: 'Bookmark successfully saved'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to listing_path, notice: 'Bookmark was successfully removed.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:listing_id, :user_id)
  end
end
