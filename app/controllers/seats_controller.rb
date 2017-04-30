class SeatsController < ApplicationController
	def new
		@movie = Movie.find(params[:movie_id])
		@schedule = @movie.schedules.find(params[:schedule_id])
		@seat = @schedule.seats.build

		@seats = @schedule.seats.all
	end

	def create
		@movie = Movie.find(params[:movie_id])
		@schedule = @movie.schedules.find(params[:schedule_id])

		@seating = params.permit(coord:[])

		@seating["coord"].each do |seat|
			@seat = @schedule.seats.new
			@split = seat.split('-')

			@seat.x = @split.first
			@seat.y = @split.last

			@seat.save
		end	

		redirect_to @movie
	end

	def confirm
		@movie = Movie.find(params[:movie_id])
		@schedule = @movie.schedules.find(params[:schedule_id])
		@seat = @schedule.seats.new
		@vatPrice = (@schedule.price*107/100.0).round(2)
		@seating = params.permit(coord:[])

		@seatX = []
		@seatY = []
		@seating["coord"].each do |seat|
			@split = seat.split('-')
			@seatX << @split.first
			@seatY << @split.last
		end
	end

	private
		def seat_params
			params.require(:seat).permit(:x,:y)
		end
end
