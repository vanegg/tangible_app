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