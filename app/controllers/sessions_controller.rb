class SessionsController < ApplicationController
  def new
  end

  def create
    # 1. find user
    @user = User.find_by({"email" => params["email"]})
    # 2. check if user exists
    if @user != nil
    # 3. check if their password is correct
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "You are now logged in."
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
      # logout the user
      flash["notice"] = "Goodbye."
      session["user_id"] = nil
      redirect_to "/login"
  end
end
  