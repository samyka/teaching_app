class InstructorsController < ApplicationController
  
  def index
  	if param = params[:subject_to_teach] and not param.blank?
  		@instructors = Instructor.where(subject_to_teach: param)
  	else
	    @instructors = Instructor.all.includes(:teacher)
	  end

    respond_to do |format|
      format.html
      format.js 
    end
  end

  def bookings
    instructor = Instructor.find(params[:id])
    results = instructor.bookings

    if params[:start]
      time    = DateTime.parse params[:start]
      results = results.where("bookings.start_time >= ?", time)
    end

    if params[:end]
      time    = DateTime.parse params[:end]
      results = results.where("bookings.end_time < ?", time)
    end

    render json: results, each_serializer: InstructorbookingSerializer
  end

  def classroom
  	@instructor = Instructor.find(params[:id])
  	# if (current_user.instructor == @instructor)
  	# 	render "classroom"
  	# else
  	# 	redirect_to "index"
  	# end
  end

  def show
    @instructor = Instructor.find(params[:id])
    @timeslots = @instructor.timeslots
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.teacher = current_user
    if @instructor.save
      redirect_to instructors_url
    else
      render :new
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(instructor_params)
      redirect_to instructor_path(@instructor)
    else
      render :edit
    end
  end

  def destroy
  end

private

  def instructor_params
    params.require(:instructor).permit(:avatar, :avatar_cache, :document, :document_cache, :country_of_origin, :skype, :first_language, :subject_to_teach, :education, :price_string, :about)
  end

	# def instructor_booking?
	# 	current_user.bookings.any? do |booking|
	# 		booking.timeslot.instructor == Instructor.find(params[:id])
	# 	end
	# end 

end
