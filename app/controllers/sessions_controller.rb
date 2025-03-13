class SessionsController < ApplicationController
  def new
  end

  def create
    # 1. find user
    @user = User.find_by({"email" => params["email"]})
    # 2. check if user exists
    if @user != nil
    # 3. check if their password is correct
      if @user["password"] == params["password"]
         flash["notice"] = "Welcome."
         redirect_to "/places"
      else
        flash["notice"] = "Check password"
        redirect_to "/login"
      end
    # 4. user doesn't exist
    else
      flash["notice"] = "Check email"
      redirect_to "/login"
    end
  end

  def destroy
  end
end
  