# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


250.times do 
	User.create!(
  	username: Faker::Internet.user_name,
  	first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
		city_time_zone: Faker::Address.time_zone,
    email: Faker::Internet.email,
    password: '123123',
    password_confirmation: '123123'
  ) 
	# print "|".green
end

languages = ["English", "Chinese", "French", "German", "Spanish", "Portuguese", "Japanese", "Russian", "Arabic"]
education_levels = ["Bachelor Degree", "Master Degree", "PhD", "Other"]

150.times do 
	Instructor.create!(
    country_of_origin: Faker::Address.country,
  	first_language: languages.sample,
  	subject_to_teach: languages.sample,
  	education: education_levels.sample,
  	teacher_id: User.all.sample.id,
  	price_cents: rand(1000...4000),
  	about: Faker::Lorem.paragraphs(paragraph_count=3).join(" "),
  	skype: Faker::Internet.user_name

    # price_currency: USD
	)
	# print "|".yellow
end

# 100.times do
# 	Booking.create!(
# 	  # time: Faker::Date.forward(10),
# 	  description: Faker::Lorem.paragraph,
# 	  student_id: User.all.sample.id,
# 	)
# 	print "|".yellow
# end
