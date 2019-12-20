class Booker
	def initialize(booker)
		@booker = booker
	end

	def instructor_booking?
		@booker.bookings.any? do |booking|
			booking.timeslot.instructor == Instructor.find()
		end
	end 

	def is_instructor_for_class?
 		current_user && current_user.instructor == @instructor 
	end

# 	<% current_user.bookings.any? do |booking| %>
# 	<% booking.timeslot.instructor == @instructor %>
# <% end %>

# <% if current_user.bookings.any? && instructor_booking? %>
# 	<% b = current_user.bookings.where('(start_time <= ? AND end_time >= ?) OR (start_time <= ? AND end_time >= ?)' , Time.zone.now + 15.minutes, Time.zone.now, Time.zone.now, Time.zone.now).take %>
# 	<% b.timeslot.instructor %>

# 	<% if current_user.bookings.any? do |booked| %>
# 		<% booked == b %>
# 	<% end %> 



end