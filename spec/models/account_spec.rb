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

  describe "with blank bank name" do
    before { @account.bank_name = " " }
    it { should_not be_valid }
  end

  describe "with blank account number" do
    before { @account.account_num = " " }
    it { should_not be_valid }
  end

  describe "with blank nickname" do
    before { @account.nickname = " " }
    it { should be_valid }
  end
  #TO DO: Add tests for maximum string length

  describe "with negative balance" do
    before { @account.balance = -1052.73 }
    it { should be_valid }
  end

  describe "with zero balance" do
    before { @account.balance = 0 }
    it { should be_valid }
  end

  describe "with positive balance" do
    before { @account.balance = 105648.12 }
    it { should be_valid }
  end

  #TO DO: Add edge case tests to balance
end
