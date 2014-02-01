class Transaction
  
  def initialize(user, bank)
    @user = user
    @bank = bank
  end
  
  def afford_loan?
    @user.bank_user_association.account_money > 0
  end

end