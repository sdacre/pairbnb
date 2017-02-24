class ListingsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => :create
#shows all listings page
	def index
		@listings = Listing.all.paginate(page: params[:page], per_page: 10)
	end

#renders page to create new listing (form on page)
	def new
		@listing = Listing.new
	end 

#method which actually creates the new listing 

	def create
	@new_listing = current_user.listings.new(listing_params)
		  if @new_listing.save
		  @notice = 'listing created'
		  else
		  @notice = 'listing creation FAILED'
		  end
		redirect_to new_listing_path, :notice => @notice
	end
	


#page where user clicked on single listing (id)
	def show
		@single_listing = Listing.find_by(id: params[:id]) 
	end

#delete single listing within show page
	def destroy
		@single_listing = Listing.find_by(id: params[:id]) 
		if @single_listing.destroy
			redirect_to listings_path, notice: 'Listing was successfully deleted.'
		end
	end

#update single listing within show page
	def edit
		@listing = Listing.find_by(id: params[:id]) 
	end

	def update
	@updated_listing = current_user.listings.find_by(id: params[:id])
	respond_to do |format|
		  if @updated_listing.update(listing_params)
			format.html { redirect_to listing_path(@updated_listing),
										notice: 'Listing was successfully updated!'
									}
			else
			format.js {  }
			end
		end 
	end 

	private
	def listing_params
		params.require(:listing).permit(:home_type,
																		:listing_type,
																		:accommodate,
																	  :bedroom,
																	  :bathroom,
																	  :summary,
																	  :address,
																	  :price,
																	  {listing_image: []})
	end 
end 
