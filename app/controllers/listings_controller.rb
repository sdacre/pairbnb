class ListingsController < ApplicationController

	def index
		@listings = Listings.all
	end
end 

	