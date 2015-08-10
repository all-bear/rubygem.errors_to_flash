require "rails_helper"

class UserControllerOnlySubclass < UserController
  errors_to_flash :fields => [:user], :only => [:create]
end

#TODO this is ugly way to use controllers
RSpec.describe UserControllerOnlySubclass, type: :controller do
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
  end

  before(:each) do
    flash[:error] = nil
  end

  it "must fill flash for action used in only option" do
    get :create
    expect(flash[:error]).to eq("First name can't be blank. Last name can't be blank")
  end

  it "must not fill flash for action not used in only option" do
    get :index
    expect(flash[:error]).to be_blank
  end
end
