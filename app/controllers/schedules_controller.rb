class SchedulesController < ApplicationController
	def index
		@schedules = Schedule.all
	end

	def new
		@movie = Movie.find(params[:movie_id])
		@schedule = @movie.schedules.build
	end

	def create
		@movie = Movie.find(params[:movie_id])
		@schedule = @movie.schedules.new(schedule_params)

		if @schedule.save
			redirect_to @movie
		else
			render 'new'
		end
	end

	def show
	end

	def edit
		@movie = Movie.find(params[:movie_id])
		@schedule = @movie.schedules.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:movie_id])
		@schedule = @movie.schedules.find(params[:id])

		if @schedule.update(schedule_params)
			redirect_to @movie
		else
			render 'edit'
		end
	end

	def destroy
		@movie = Movie.find(params[:movie_id])
		@schedule = @movie.schedules.find(params[:id])

		@schedule.destroy
		redirect_to @movie
	end

	private
		def schedule_params
			params.require(:schedule).permit(:stime,:price)
		end
end
