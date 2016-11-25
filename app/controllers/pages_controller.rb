class PagesController < ApplicationController

  def showpage
    @album = Album.find(params[:album])
    page_num = params[:page].to_i
    left_urls = {}
    right_urls = {}
    
    left_page = Page.where(page_num: page_num, album_id: @album.id).first
    right_page = Page.where(page_num: page_num + 1, album_id: @album.id).first
    left_urls["page"] = page_num 
    right_urls["page"] = page_num + 1

    left_page.locations.each{|loc| left_urls[loc.page_place] = Photo.find(loc.photo_id).photo_url(:large)}
    right_page.locations.each{|loc| right_urls[loc.page_place] = Photo.find(loc.photo_id).photo_url(:large)}
    @left_urls = left_urls.to_json
    @right_urls = right_urls.to_json
  end

  def updatelayout
    page = Page.where(page_num: params[:page_num], album_id: params[:album]).first
    page.update_attribute(:layout, params[:layout])
    page.save
  end

end