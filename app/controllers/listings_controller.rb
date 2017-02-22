class ListingsController < ApplicationController


#shows all listings page
	def index
		@listings = Listing.all
	end

#renders page to create new listing (form on page)
	def new
		@listing = Listing.new
	end 

#method which actually creates the new listing 

	def create
	@new_listing = current_user.listings.new(listing_params)
		respond_to do |format|
		  if @new_listing.save!
		  format.html { redirect_to listing_path(@new_listing), notice: 'Listing was successfully created.' }
		  else
		  format.js {  }
		  end
		end
	end

#page where user clicked on single listing (id)
	def show
		@single_listing = Listing.find_by(id: params[:id]) 
	end

	private
	def listing_params
		params.require(:listing).permit(:home_type, :listing_type, :accommodate, :bedroom, :bathroom, :summary, :address)
	end 
end 
