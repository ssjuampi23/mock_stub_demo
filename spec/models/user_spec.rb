require 'spec_helper'

describe User do

  before do
    @user = build_stubbed(:user)
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:last_name) }

  it { should be_valid }

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "new User" do
    it "should create a new instance of User" do
      expect(@user).to be_an_instance_of(User)
    end
  end

  describe "when name is not present" do
    it "should not be valid" do
      invalid_user = build(:invalid_user)
      invalid_user.should_not be_valid
    end
  end
  
  before(:each) do
    @user.stub(:name).and_return("John Doe")
    @bank = double("bank", name: "Mock Bank") # This is a mock object
  end
  
  describe "stubbed methods" do
    it "should have a stubbed name" do
      expect(@user.name).to eq "John Doe"
    end
    
    it "should allow an email for the user" do
      allow(@user).to receive(:email) { "test@email.com" }
      expect(@user.email).to eq "test@email.com"
    end
    
    it "should allow to stub a method for the User model" do
      allow(User).to receive(:height) { "1.72 cm" }
      expect(User.height).to eq "1.72 cm"
    end
    
    it "should allow a name for the bank" do
      allow(@bank).to receive(:title) { "The Greatest Bank" }
      expect(@bank.title).to eq "The Greatest Bank"
    end
    
    it "should have a stubbed name for the bank" do
      expect(@bank.name).to eq "Mock Bank"
    end
  end

end
