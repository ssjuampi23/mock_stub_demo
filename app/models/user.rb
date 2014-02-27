class User < ActiveRecord::Base
  validates_presence_of :name, :last_name
  validates_length_of :name, maximum: 50
  
  has_one :bank_user_association
  has_one :bank, through: :bank_user_associations
end