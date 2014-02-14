class Transaction

  # The fact that this class never hits the database makes it a perfect scenario
  # for using mock and stub tests.
  
  def initialize(user, bank)
    @user = user
    @bank = bank
  end

  def afford_loan?
    @user && @user.account_money > 0
  end
  
  def has_user?
    @user.present?  
  end
  
  def has_bank?
    @bank.present?
  end

end