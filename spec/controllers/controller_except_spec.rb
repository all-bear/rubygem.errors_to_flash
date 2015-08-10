require "rails_helper"

class UserControllerCreateSubclass < UserController
  errors_to_flash :fields => [:user], :except => [:create]
end

#TODO this is ugly way to use controllers
RSpec.describe UserControllerCreateSubclass, type: :controller do
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

  it "must not fill flash for action used in except option" do
    get :create
    expect(flash[:error]).to be_blank
  end

  it "must fill flash for action not used in except option" do
    get :index
    expect(flash[:error]).to eq("First name can't be blank. Last name can't be blank")
  end
end
