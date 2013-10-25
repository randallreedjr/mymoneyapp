require 'spec_helper'

describe "Account pages" do
	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "account creation" do
		before { visit root_path }

		describe "with invalid information" do

			it "should not create an account" do
				expect { click_button "Post" }.not_to change(Account, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before { fill_in 'account_account_num', with: "0001" }
			before { fill_in 'account_bankname', with: "Test Bank" }
			before { fill_in 'account_balance', with: 100 }
			it "should create an account" do
				expect { click_button "Post" }.to change(Account, :count).by(1)
			end
		end
	end
end
