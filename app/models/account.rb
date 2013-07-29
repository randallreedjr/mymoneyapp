class Account < ActiveRecord::Base
  attr_accessible :account_num, :balance, :bank_name, :nickname
  belongs_to :user

  validates :user_id, presence: true

  default_scope order: 'accounts.balance DESC'
end
