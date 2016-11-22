class PagesController < ApplicationController
  def newpage
  	p params
  	type = params[:type]
  	@album = Album.find(params[:album])

  	if type == 'prev'
  		current_page_id = params[:page].to_i
  		if current_page_id == 1
  			p "Estas en el final del album"
  			return
  		end
  		@page_left = Page.where(page_num: current_page_id - 2, album_id: @album.id).first
  		@page_right = Page.where(page_num: current_page_id - 1, album_id: @album.id).first

  	elsif type == 'next'
  		current_page_id = params[:page].to_i + 1
  		if current_page_id == @album.pages.length
  			p "Estas en el final del album"
  			return
  		end
  		p @page_left = Page.where(page_num: current_page_id + 1, album_id: @album.id).first
  		p @page_right = Page.where(page_num: current_page_id + 2, album_id: @album.id).first
  	end
    p '*' * 50
    p @page_left.layout
  end
end