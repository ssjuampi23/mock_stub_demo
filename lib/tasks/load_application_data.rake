namespace :tasks do

  desc "Load Application Data into the Data base"
  task :load_application_data => :environment do
    #Loads the user model data
    user  = User.create(name: 'John', last_name: 'Smith', account_money: 0)
    user2 = User.create(name: 'Steve', last_name: 'Olsen', account_money: 150000)
    user3 = User.create(name: 'Charlie', last_name: 'Redford', account_money: 200000)
    #Loads the bank model data
    bank  = Bank.create(name: 'Central Bank')
    bank2 = Bank.create(name: 'United Bank')
    bank3 = Bank.create(name: 'National Bank')
    #Loads the bank user association model data
    BankUserAssociation.create(user_id:  user.id, bank_id: bank.id)
    BankUserAssociation.create(user_id: user2.id, bank_id: bank2.id)
    BankUserAssociation.create(user_id: user3.id, bank_id: bank3.id)
    
    puts "Data loaded"
  end

end

