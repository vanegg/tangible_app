class Page < ApplicationRecord

	has_many :locations
	has_many :photos, through: :locations

	validates :layout, presence: true
	validates :page_num, presence: true

end
