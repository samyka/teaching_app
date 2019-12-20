require 'test_helper'

class TimeslotTest < ActiveSupport::TestCase

	test "times that overlap are not available for booking" do
		timeslot = timeslots(:one)
		start_time = timeslot.start_time + 30.minutes
		end_time = start_time + 30.minutes
		available = timeslot.is_available?(start_time, end_time)
		assert_equal(false, available)
	end

	test "times that are back to back are available" do
		timeslot = timeslots(:one)
		start_time = bookings(:one).end_time
		end_time = bookings(:two).start_time
		available = timeslot.is_available?(start_time, end_time)
		assert_equal(true, available)
	end
end
