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
    
		redirect_to new_user_album_path(current_user.id)
	end

	private
		def photo_params
      params.require(:photo).permit({photo: []})
		end
end