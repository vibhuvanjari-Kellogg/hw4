class UsersController < ApplicationController
  def show
    @user = User.find_by({"id" => params["id"]})
  end
  
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = params["password"]
    @user.save
    redirect_to "/users/#{@user["id"]}"
  end
end
