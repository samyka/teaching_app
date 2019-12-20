class ChangeColumnType < ActiveRecord::Migration
  def change
	  drop_table :bookings
	  create_table :bookings do |t|
	    t.text     :description
	    t.integer  :student_id
	    t.integer  :timeslot_id
	    t.datetime :start_time
	    t.datetime :end_time
	   end
  end
end
