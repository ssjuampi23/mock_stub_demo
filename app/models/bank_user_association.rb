class BankUserAssociation < ActiveRecord::Base
  belongs_to :user
  belongs_to :bank  
end