class PhotosController < ApplicationController

	def create
		@user = User.find(params[:user_id])
    err_msg = []

    photo_params[:photo].each do |photo_object|
      @photo = Photo.new(photo: photo_object)
      if @photo.save
        @user.photos << @photo
      else
        err_msg << photo_object.original_filename
      end
    end

    if err_msg.empty?
      flash[:success] = "Photo/s uploaded!"
    else
      flash[:danger] = "Unable to upload: #{err_msg.join()}"
    end
    redirect_to user_path(current_user)
	end

  def addpage

    album = Album.find(params[:album])
    page = album.pages.find_by(page_num: params[:num_page])
    page_place = params[:page_place]
    url = params[:url]

    unless url.match('\/\d+\/').nil?
      photo_id = url.match('\/\d+\/')[0].gsub('/','').to_i
      photo = Photo.find(photo_id)
    end

    
    if photo 
      location = Location.where(page_id: page.id, page_place: page_place).first

      if location
        updatelocation(location, photo)
      else
        location = Location.create(photo_id: photo_id, page_id: page.id, page_place: page_place)
        photo.locations << location
        photo.save
      end
    end
    render json: location.to_json
  end

	private
		def photo_params
      params.require(:photo).permit({photo: []})
		end

    def updatelocation (location, photo)
      location.update_attribute(:photo_id, photo.id)
      location.save
    end
end