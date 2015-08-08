class UserController < ApplicationController
  #errors_to_flash :fields => [:user], :only => [:create]
  #errors_to_flash :models => [:user], :only => [:create]
  #errors_to_flash :only => [:create]
  #errors_to_flash :except => [:create]

  private
  def user_params
    {}
  end
end
