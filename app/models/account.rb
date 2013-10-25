# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  user_id	  :integer          not null
#  bank_name  :string(255)      not null
#  account_num :string(255)     not null
#  nickname   :string(255)      not null
#  balance    :decimal(13,2)    not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :account_num, :balance, :bank_name, :nickname
  belongs_to :user

  validates :user_id, presence: true
  validates :account_num, presence: true, length: { maximum: 17 }
  validates :bank_name, presence: true, length: { maximum: 35 }
  validates :balance, presence: true

  default_scope order: 'accounts.balance DESC'
end
