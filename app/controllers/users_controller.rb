class UsersController < Clearance::UsersController

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
	@user = User.new(user_params)
		respond_to do |format|
		  if @user.save
		  format.html { redirect_to root_path,
		  							notice: 'User was successfully created.'
		  						}
		  else
		  format.js {  }
		  end
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password)
	end 

end
