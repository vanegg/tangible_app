class Photo < ApplicationRecord

	validates :url, uniqueness: true
	has_many :locations
	has_many :pages, through: :locations
	# validate :image_size

	mount_uploader :image, ImageUploader
	 
	# private
	#   def image_size
	#     errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
	#   end
end
