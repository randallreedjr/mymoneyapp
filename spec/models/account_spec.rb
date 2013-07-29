require 'spec_helper'

describe Account do
  let(:user) { FactoryGirl.create(:user) }
  before {
  	#This code is wrong!
  	@account = user.accounts.build(bank_name: "Capital One 360", account_num: "1234567891011", 
  								   nickname: "Vacation", balance: 100.15)
  							
  }

  subject { @account }

  it { should respond_to(:balance) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			Account.new(user_id: user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  describe "when user_id is not present" do
  	before { @account.user_id = nil }
  	it { should_not be_valid }
  end
end
