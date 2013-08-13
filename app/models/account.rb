class Account < ActiveRecord::Base
  attr_accessible :account_num, :balance, :bank_name, :nickname
  belongs_to :user

  validates :user_id, presence: true
  validates :account_num, presence: true, length: { maximum: 17 }
  validates :bank_name, presence: true, length: { maximum: 35 }
  validates :balance, presence: true

  default_scope order: 'accounts.balance DESC'
end
