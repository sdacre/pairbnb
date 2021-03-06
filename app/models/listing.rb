class Listing < ApplicationRecord
mount_uploaders :listing_image, ListingImageUploader
	validates :home_type,
            :listing_type,
            :accommodate,
            :bedroom,
            :bathroom,
            :summary,
            :address,
            :price,
            :city,
            presence: true

  # geocoded_by :address geocode gem to be added here

	validates :summary, length: { maximum: 500 }
	validates :address, length: { maximum: 50 }

	belongs_to :user
	has_many :reservation
	has_many :listing_tags
  has_many :tags, through: :listing_tags

  def self.home_types
  	[
  		["Shared Room","Shared Room"],
  		["Private Room","Private Room"], 
  		["Entire Home/Apt","Entire Home/Apt"]
  	] 
 	end

 	def self.listing_types
  	[
  		["Apartment","Apartment"],
  		["House","House"], 
  	] 
	end 

	 	def self.accommodate
  	[
  		["1","1"],
  		["2","2"], 
  		["3","3"],
  		["4","4"],
  		["5","5"],
  		["6","6"],
  		["7","7"],
  		["8","8"],
  		["9","9"],
  		["10","10"],
  		["11","11"],
  		["12","12"],
  		["13","13"],
  		["14","14"],
  		["15","15"],
  		["16","16"],
  	] 
	end 

	 	def self.bedroom
  	[
  		["1","1"],
  		["2","2"], 
  		["3","3"],
  		["4","4"],
  		["5","5"],
  		["6","6"],
  		["7","7"],
  		["8","8"],
  		["9","9"],
  		["10","10"],
  	] 
	end 

	 	def self.bathroom
  	[
  		["1","1"],
  		["2","2"], 
  		["3","3"],
  		["4","4"],
  		["5","5"],
  		["6","6"],
  		["7","7"],
  		["8","8"],
  	] 
	end 

  def self.city
    [
      ["Vancouver","Vancouver"],
      ["Kuala Lumpur","Kuala Lumpur"], 
    ] 
  end

  def self.search(search)
  where("city ILIKE ?", "%#{city}%") 
  end

end


