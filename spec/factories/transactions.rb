require 'faker'

FactoryGirl.define do

  factory :transaction do
    ignore do
      user { build(:user) }
      bank { build(:bank) }
    end

    initialize_with{ Transaction.new( user, bank ) }
  end

end