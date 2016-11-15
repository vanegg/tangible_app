class PhotosController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@photo = Photo.new(photo_params)
    if @photo.save
      @user.photos << @photo
      flash[:success] = "Photo uploaded!"
    else
      flash[:danger] = "Unable to upload file. Please check it is in 'jpg', 'jpeg', 'gif', or 'png' format."
    end
		redirect_to user_path(params[:user_id])
	end

	private
		def photo_params
      params.require(:photo).permit(:photo)
		end
end