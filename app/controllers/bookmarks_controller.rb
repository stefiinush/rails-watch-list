# class BookmarksController < ApplicationController
#   before_action :set_bookmark, only: [:show]

#   def index
#     @bookmarks = Bookmark.all
#   end

#   def show
#     @bookmark = Bookmark.find(params[:id])
#   end

#   def create
#     @bookmark = Bookmark.new(bookmark_params)
#     @bookmark.list = @list
#     @bookmark.save
#     redirect_to list_path(@list)
#   end

#   def destroy
#     @bookmark = Bookmark.find(params[:id])
#     @bookmark.destroy
#   end

#   private

#   def set_bookmark
#     @bookmark = Bookmark.find(params[:id])
#   end

#   def bookmark_params
#     params.require(:bookmark).permit(:comment)
#   end

# end


class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
