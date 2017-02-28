class ReservationsController < ApplicationController

#show all reservations page 
	def index
		@reservations = Reservation.all
		@user_reservations = current_user.reservations.all
	end 


#renders page to create reservation
	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end 

#creates a reservation
	def create
		@listing = Listing.find(params[:reservation][:listing_id])
		@new_reservation = current_user.reservations.new(reservation_params)
		if @new_reservation.save
			@notice = 'reservation created'
			redirect_to reservations_path, :notice => @notice
		else
			@notice = 'reservation creation FAILED'
			redirect_to new_listing_reservation_path, :notice => @notice
		end
	end 

#shows a specific reservation
	def show
		@reservations = Reservation.find_by(id: params[:id]) 
	end 

	def destroy
		@single_reservation = Reservation.find_by(id: params[:id]) 
		if @single_reservation.destroy
			redirect_to reservations_path, notice: 'Reservation was successfully deleted.'
		end
	end

#update single listing within show page
	def edit
		@reservation = Reservation.find_by(id: params[:id]) 
	end

#update reservation
	def update
	@updated_reservation = current_user.reservations.find_by(id: params[:id])
	respond_to do |format|
		  if @updated_reservation.update(reservation_params)
			@notice = 'reservation updated'
			else
			@notice = 'reservation update FAILED'
			end 
			redirect_to new_reservation_path, :notice => @notice
		end 
	end 


	private
	def reservation_params
		params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date)
	end 
end 