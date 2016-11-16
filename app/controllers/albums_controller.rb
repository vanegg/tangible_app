class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(title: params[:title])
    if @album.save
      current_user.albums << @album
      flash[:success] = "Album has been created!"
    else
      flash[:error] = "Album could not be saved."
    end
    redirect_to album_show_path(@album.id)
  end

  def index  
  end

end