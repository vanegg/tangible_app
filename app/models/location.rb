class Location < ApplicationRecord
	belongs_to :photo
	belongs_to :page
	validates :page_place, presence: true
end
