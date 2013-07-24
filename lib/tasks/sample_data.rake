namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Example User", 
							 email: "example@test.com",
							 password: "foobar99", 
							 password_confirmation: "foobar99")
		admin.toggle!(:admin)
		
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@text.com"
			password = "password"
			User.create!(name: name,
						 email: email,
						 password: password,
						 password_confirmation: password)
		end
	end
end