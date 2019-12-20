class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.text :description
      
      t.integer :student_id
      t.integer :timeslot_id

      t.datetime :start_time
  		t.datetime :end_time 

      t.timestamps null: false
    end
  end
end
