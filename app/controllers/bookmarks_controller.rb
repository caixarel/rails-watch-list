class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
        redirect_to list_path(List.find(params[:list_id]))
    else
      render :new
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(List.find(params[:list_id]))

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
