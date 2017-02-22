class ListingsController < ApplicationController

before_action :authenticate_user!, except: [:show]

#shows all listings page
	def index
		@listings = Listings.all
	end

#renders page to create new listing (form on page)
	def new
	end 

#method which actually creates the new listing 

	def create
	@new_listing = Listing.new(listing_params)
		respond_to do |format|
		  if @new_listing.save
		  format.html { redirect_to user_listing_path, notice: 'Listing was successfully created.' }
		  else
		  format.js {  }
		  end
		end
	end

#page where user clicked on single listing (id)
	def show
		@single_listing = Listings.find_by(params[:id]) 
	end

	private
	def listing_params
		params.require(:user_id).permit(:home_type, :listing_type, :accommodate, :bedroom, :bathoom, :summary, :address)
	end 
end 
