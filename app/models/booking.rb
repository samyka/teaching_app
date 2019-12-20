class Booking < ActiveRecord::Base
	belongs_to :timeslot
	has_many :instructors, through: :timeslot
	belongs_to :student, class_name: 'User'
	before_validation :mark_times_utc


	# validate :fits_within_open_slot
	validate :consistent

	def timerange
		TimeRange.new(start_time, end_time)
	end

	private
	def consistent
		unless timeslot.is_available?(self)
			errors.add(:timeslot, "is unavailable for that booking")
		end

		unless student.double_booking?(self)
			errors.add(:booking, "is not available, you have another booking at that time")
		end

		if start_time > end_time
			errors.add(:start_time, "Cannot be greater than the end time")
		end

	end

  def mark_times_utc
    self.start_time = start_time.utc if start_time
    self.end_time = end_time.utc if end_time
  end
end

