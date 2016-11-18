class PagesController < ApplicationController
  def newpage
  	p params
  	album = Album.find(params[:album])
  	current_page_id = params[:page].to_i
  	type = params[:type]

  	if (type == 'prev' && current_page_id == 1) || (type == 'next' && current_page_id + 1 == album.pages.length)
  		p "Estas en el final del album"
  		return
  	end

  	p current_page = Page.where(page_num: current_page_id, album_id: album.id)
  	p 'hola mundo'
  end
end
