require 'spec_helper'

describe Transaction do

  before do
    @transaction = build(:transaction)
  end

  subject { @transaction }

  describe "new Transaction" do
    it "should create a new instance of Transaction" do
      expect(@transaction).to be_an_instance_of(Transaction)
    end
    
    # Usual tests
    
    it "should have an user" do
      expect(@transaction.has_user?).to be true
    end
    
    it "should have a bank" do
      expect(@transaction.has_bank?).to be true
    end
    
    it "should afford a loan" do
      expect(@transaction.afford_loan?).to be true
    end
    
    # Stubbed tests
    
    it "should not afford a loan" do
      @transaction.stub(:afford_loan?).and_return("No money")
      expect(@transaction.afford_loan?).to eq "No money"
    end
    
    it "should not have an user" do
      @transaction.stub(:has_user?).and_return("No user")
      expect(@transaction.has_user?).to eq "No user"
    end
    
    it "should not have a bank" do
      @transaction.stub(:has_bank?).and_return("No bank")
      expect(@transaction.has_bank?).to eq "No bank"
    end
  end
end
