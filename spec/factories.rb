FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password	"foobar12"
		password_confirmation "foobar12"

		factory :admin do
			admin true
		end
	end

	factory :account do
		bank_name "Bank of Test"
		sequence(:account_num) { |n| "#{n}"}
		sequence(:nickname) { |n| "Account #{n}" }
		#sequence(:balance) { |n| "#{n*100+n}" }
		user
	end
end