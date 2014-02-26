require 'spec_helper'

describe UsersController do
  # We use the # symbol when it is an instance method => #new
  # We use the . symbol when it is a class method => .new

  before(:each) do
    @users_controller = build(:users_controller)
    @users_controller.stub(:response).and_return("Response")
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      response.should be_success
      expect(response.status).to eq(200)
    end

    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "validates that the new method is called by the User model" do
      User.should_receive(:new)
      get :new
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
      expect(response.body).to eq ""
    end
  end

  describe "GET #index" do
    it "returns all the users stored in the database orderered by name" do
      users = User.order(:name)
      get :index
      expect(assigns(:users)).to eq users
    end

    it "performs a stub using the index method" do
      @users_controller.stub(:index).and_return("No User")
      response = @users_controller.index
      expect(response).to eq "No User"
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "validates that all users are orderered by name" do
      User.should_receive(:order).with(:name)
      @users_controller.index
    end

    it "stubs a response to a requested action" do
      allow(@users_controller.response).to receive(:status) { 200 }
      @users_controller.index
      expect(@users_controller.response.status).to eq(200)
    end
    
    it "stubs the response status to a requested action" do
      allow(@users_controller.response).to receive(:success?) { true }
      @users_controller.index
      @users_controller.response.should be_success
    end
    
    it "stubs a render of the index view" do
      get :index
      expect(@users_controller.response).to render_template("index")
    end
  end
end

