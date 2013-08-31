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

		users = User.all(limit: 6)
		10.times do |n|
			account_num = "#{n+1}"
			balance = 111*n
			bank_name = "Bank #{n+1}"
			users.each { |user| user.accounts.create!(account_num: account_num, 
														bank_name: bank_name, 
														balance: balance) }
		end
	end
end