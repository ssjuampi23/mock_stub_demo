require 'faker'

FactoryGirl.define do

  factory :bank_user_association do
    user_id Faker::Number.number(2).to_i
    bank_id Faker::Number.number(2).to_i
  end

end