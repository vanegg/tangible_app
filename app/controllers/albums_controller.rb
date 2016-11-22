class AlbumsController < ApplicationController

  def new
    @album = Album.new
    current_user.albums << @album
    p "album/**/new"*5
    p @album.save
    p "album/**/new"*5
    8.times do |n|
      p page = Page.new(layout: 0, page_num: n + 1)
      p @album.pages << page
      p page.save
    end
  end

  def create
    @album = Album.new
    if @album.save
      current_user.albums << @album
      8.times do |n|
        p page = Page.new(layout: 0, page_num: n + 1)
        p @album.pages << page
        p page.save
      end
      flash[:success] = "Album has been created!"
    else
      flash[:error] = "Album could not be saved."
    end
    redirect_to user_album_path(current_user, @album)
  end

  def show
    @album = Album.find(params[:id])
  end

  def updatetitle
    
  end

  def save_changes 
  end

  def edit
  end

end