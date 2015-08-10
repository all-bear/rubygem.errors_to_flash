require "rails_helper"

class UserControllerFieldSubclass < UserController
  errors_to_flash :fields => [:user]
end

#TODO this is ugly way to use controllers
RSpec.describe UserControllerFieldSubclass, type: :controller do
  controller do
    def create
      @user = User.new(user_params)
      @user.save
      render :text => ""
    end

    def index
      @user = User.new(user_params)
      @user.save
      render :text => ""
    end

    def new
      @another_user = User.new(user_params)
      @another_user.save
      render :text => ""
    end
  end

  before(:each) do
    flash[:error] = nil
  end

  it "must fill flash on all actions" do
    get :create
    expect(flash[:error]).to eq("First name can't be blank. Last name can't be blank")
  end

  it "must fill flash on all actions" do
    get :index
    expect(flash[:error]).to eq("First name can't be blank. Last name can't be blank")
  end

  it "must fill flash only for used field" do
    get :new
    expect(flash[:error]).to be_blank
  end

  it "must raise exception if fields not defined" do
    expect {
      class UserControllerFieldNotDefinedSubclass < UserController
        errors_to_flash :fields=>[]
      end
    }.to raise_error(ArgumentError)
  end
end
