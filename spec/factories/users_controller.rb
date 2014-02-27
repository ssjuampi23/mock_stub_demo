FactoryGirl.define do
  
  # This is just an example that even controllers can have their own factories.
  factory :users_controller do
    initialize_with{ UsersController.new }
  end

end