class UsersController < ApplicationController
	def new
		
	end

	def create
		@user = User.create(user_params) 
		if @user
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:message] = "Incorrect Info!"
			redirect_to new_user_path
		end
	end

	def show
		@user = User.find_by(id: session[:user_id])
		if !@user
			redirect_to index_path
		else
			render :show
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password, :password_confirmation)
	end
end