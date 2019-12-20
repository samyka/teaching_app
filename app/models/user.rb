class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :instructor, foreign_key: :teacher_id
  has_many :bookings, foreign_key: :student_id

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city_time_zone, presence: true

  validates :email, uniqueness: true
  
  def name
  	[first_name.titleize, last_name.titleize].join(' ')
  end
  
  def double_booking?(requested_booking)
    booking_time = requested_booking.timerange

    no_double_booking = self.bookings.none? do |booking|
      booking.timerange.overlap?(booking_time)
    end
    
    no_double_booking
  end

end
