class SessionsController < ApplicationController
	def index

	end
	
	def new
		
	end

	def create

		@user = User.find_by(name: params[:user][:name])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:message] = "Incorrect Info!"
			redirect_to sign_in_path
		end
	end

	def destroy
		session.clear
		redirect_to index_path
	end
end