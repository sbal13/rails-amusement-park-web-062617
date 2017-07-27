class RidesController < ApplicationController
	def create
		# @user = User.find_by(id: session[:user_id])
		# @attraction = Attraction.find_by(id: session[:current_attraction_id])
		# ride = Ride.create(user: @user, attraction: @attraction)

		ride = Ride.create(user_id: session[:user_id], attraction_id: session[:current_attraction_id])
		flash[:message] = ride.take_ride

		redirect_to user_path(session[:user_id])
	end
end