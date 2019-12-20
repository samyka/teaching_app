class ActiveRecord::Base
	def joined_fields(*fields)
		fields.map{|f| send(f)}.join(" ").titleize
	end
end

class Instructor < ActiveRecord::Base
	has_many :bookings, through: :timeslots
	has_many :timeslots
	belongs_to :teacher, class_name: 'User', foreign_key: :teacher_id

# Only do this when the site goes live as it might disable the default generated avatars:
# validates :avatar, presence: true

	validates :country_of_origin, presence: true
	validates :first_language, presence: true
	validates :subject_to_teach, presence: true
	validates :education, presence: true
	validates :price_string, presence: true
	validates :about, presence: true

	monetize :price_cents
	
	mount_uploader :avatar, AvatarUploader
	mount_uploader :document, DocumentUploader


	def country_name
		country = ISO3166::Country[country_of_origin]
    # country.translations[I18n.locale.to_s] || country.name
  end

	def price_string
		price && price.format
	end
# gotta change this so that the '$' isn't automatically rendered in the input field of instructor create
	def price_string=(val)
		if val =~ /(\d+(\.\d+)?)/
			self.price_cents = ($1.to_f * 100).to_i # convert to cents
		else
			raise "Couldn't turn this into a price: #{val.inspect}"
		end
	end
	
end