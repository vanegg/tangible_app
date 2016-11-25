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
      flash[:success] = "Tu album ha sido creado - ahora a llenarla con photos!"
    else
      flash[:error] = "Tu album no pudo ser creado."
    end
    redirect_to user_album_path(current_user, @album)
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    Album.find(params[:id]).destroy
    flash[:success] = "Tu album ha sido borrado."
    redirect_to user_albums_path(current_user)
  end

  def updatetitle
    album = Album.find(params[:id])
    album.update_attribute(:title, params[:title])
    if album.save
      p album
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def save_changes 
  end

  def edit
  end

end