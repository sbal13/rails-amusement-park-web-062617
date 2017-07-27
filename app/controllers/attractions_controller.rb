class AttractionsController < ApplicationController
	def index
		@attractions = Attraction.all
		@user = User.find_by(id: session[:user_id])
		if @user.admin
			@message = "Show"
		else
			@message = "Go on"
		end
	end

	def new
	end

	def create
		@attraction = Attraction.create(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])
		@attraction.update(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def show
		@attraction = Attraction.find(params[:id])
		@user = User.find_by(id: session[:user_id])
		session[:current_attraction_id] = @attraction.id
	end

	def destroy
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
	end
end