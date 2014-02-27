require 'faker'

FactoryGirl.define do

  factory :user do
    association :bank_user_association
    name Faker::Name.name 
    last_name Faker::Name.last_name 
    account_money Faker::Number.number(6).to_i

    factory :invalid_user do
      name nil
      last_name nil
    end
  end

end