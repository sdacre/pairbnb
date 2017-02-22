class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservation

	validates :home_type, :listing_type, :accomodate, :bedroom, :bathroom, :listing_name, :summary, :address, presence :true
	validates :listing_name, length: { maximum :50 } 
	validates :summary, length: { maximum :500 }
end
