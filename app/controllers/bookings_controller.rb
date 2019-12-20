class BookingsController < ApplicationController
  before_action :load_timeslot_and_instructor, except: [:index]
    
  def index
  	results = current_user.bookings

    if params[:start]
      time    = DateTime.parse params[:start]
      results = results.where("start_time >= ?", time)
    end

    if params[:end]
      time    = DateTime.parse params[:end]
      results = results.where("end_time < ?", time)
    end

    render json: results, each_serializer: BookingSerializer
  end

  def new
    @booking = @timeslot.bookings.new
  end

  def create
    @booking          = Booking.new booking_params
    @booking.timeslot = @timeslot
    @booking.student  = current_user
    
    respond_to do |format|
      if @booking.save
        format.html { redirect_to instructor_path(@instructor) }
        format.js {}
      else
        format.html {render :new, alert: "Create timeslot failed"}
        format.js {}
      end
    end
  end

  def show
  end

  def delete
  end

private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def load_timeslot_and_instructor
    @timeslot   = Timeslot.find(params[:timeslot_id])
    @instructor = @timeslot.instructor
  end
end

