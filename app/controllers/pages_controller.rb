class PagesController < ApplicationController
  # def newpage
  # 	p params
  # 	type = params[:type]
  # 	@album = Album.find(params[:album])

  # 	if type == 'prev'
  # 		current_page_id = params[:page].to_i
  # 		if current_page_id == 1
  # 			p "Estas en el final del album"
  # 			return
  # 		end
  # 		@page_left = Page.where(page_num: current_page_id - 2, album_id: @album.id).first
  # 		@page_right = Page.where(page_num: current_page_id - 1, album_id: @album.id).first

  # 	elsif type == 'next'
  # 		current_page_id = params[:page].to_i + 1
  # 		if current_page_id == @album.pages.length
  # 			p "Estas en el final del album"
  # 			return
  # 		end
  # 		p @page_left = Page.where(page_num: current_page_id + 1, album_id: @album.id).first
  # 		p @page_right = Page.where(page_num: current_page_id + 2, album_id: @album.id).first
  # 	end
  #   p '*' * 50
  #   p @page_left.layout
  # end

  def newpage
    p params
    @album = Album.find(params[:album])
    page_num = params[:page].to_i
    
    if params[:type] == 'prev'
      if page_num == 1
        p "Estas en el final del album"
        return
      end
      left_page = Page.where(page_num: page_num - 2, album_id: @album.id).first
      right_page = Page.where(page_num: page_num - 1, album_id: @album.id).first


    elsif params[:type] == 'next'
      if page_num == @album.pages.length + 1
        p "Estas en el final del album"
        return
      end
      left_page = Page.where(page_num: page_num + 2, album_id: @album.id).first
      right_page = Page.where(page_num: page_num + 3, album_id: @album.id).first
    end
    left_urls = {}
    right_urls = {}
    left_page.locations.each{|loc| left_urls[loc.page_place] = Photo.find(loc.photo_id).photo_url(:large)}
    right_page.locations.each{|loc| right_urls[loc.page_place] = Photo.find(loc.photo_id).photo_url(:large)}
    p '*' * 50
    p @left_urls = left_urls.to_json
    p @right_urls = right_urls.to_json
    p '*' * 50
  end

  def updatelayout
    page = Page.where(page_num: params[:page_num], album_id: params[:album]).first
    page.update_attribute(:layout, params[:layout])
    page.save
  end
end