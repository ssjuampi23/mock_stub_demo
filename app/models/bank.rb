class Bank < ActiveRecord::Base
  
  has_many :bank_user_associations
  has_many :users, through: :bank_user_associations
end