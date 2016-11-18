class AlbumsController < ApplicationController

  def new
    @album = Album.new

    5.times do |n|
      page = Page.new(page_num: n)
      @album.pages << page
      page.save
    end
    p "album/**/new"*5
    # render '_album_carousel'
  end

  def create
    @album = Album.new(title: params[:title])
    if @album.save
      current_user.albums << @album
      flash[:success] = "Album has been created!"
    else
      flash[:error] = "Album could not be saved."
    end
    p "album/create"*5
    redirect_to album_show_path(@album.id)
  end

  def title
    
  end

  def save_changes 
  end

  def edit
  end

end