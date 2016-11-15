class Photo < ApplicationRecord

	validates :url, uniqueness: true
	has_many :locations
	has_many :pages, through: :locations

end
