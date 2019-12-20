class TimeslotsController < ApplicationController
	before_action :load_instructor

	def index
		results = @instructor.timeslots

		if params[:start]

			time 		= DateTime.parse params[:start]
			results = results.where("start_time >= ?", time)
		end

		if params[:end]
			time 		= DateTime.parse params[:end]
			results = results.where("end_time < ?", time)
		end

		render json: results, each_serializer: TimeslotSerializer
	end

	def new
		@timeslot = @instructor.timeslots.build
	end

	def create
		@timeslot = @instructor.timeslots.new(timeslot_params)	

			respond_to do |format|
			if @timeslot.save
				format.html { redirect_to instructor_path(@instructor) }
				format.js {}
			else
				format.html {render :new, alert: "Create timeslot failed"}
				format.js {}
			end	
		end
	end


private	
	def timeslot_params
		params[:timeslot].permit(:start_time, :end_time)
	end

	def load_instructor
		@instructor = Instructor.find(params[:instructor_id])
	end
end
