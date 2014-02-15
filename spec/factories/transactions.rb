require 'faker'

FactoryGirl.define do

  factory :transaction do
    ignore do
      user { build_stubbed(:user) }
      bank { build_stubbed(:bank) }
    end

    initialize_with{ Transaction.new( user, bank ) }
  end

end