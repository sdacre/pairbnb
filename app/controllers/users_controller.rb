class UsersController < Clearance::UsersController

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end
 
  def update 
  	@user = User.find(params[:id])
	  	if @user.update(user_params)
	  	@notice = "User updated!"
			else
			@notice = "User update FAILED"
			end 
    redirect_to user_path(@user), :notice => @notice
  end

	def create
	@user = User.new(user_params)
		respond_to do |format|
		  if @user.save
		  format.html { redirect_to root_path,
		  							notice: 'User was successfully created'
		  						}
		  else
		  format.html { redirect_to root_path,
		  							notice: 'Failed'
		  						}
		  end
		end
	end


	private
	def user_params
		params.require(:user).permit(:email, :password, :image, :remove_image)
	end 

end
