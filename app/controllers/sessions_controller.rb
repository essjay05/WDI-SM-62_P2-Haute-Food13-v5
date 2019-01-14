class SessionsController < ApplicationController
  def new
  end

  def create
    # Find User by ID since only one email per user...
    @user = User.find_by_email(params[:email])
      #Check if user exists in the database... if yes, create session and redirect to user's page
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        #If user does not exist in database, redirect to login or sign up page
        redirect_to new_user_path, danger: "Error! Invalid email or password!"
        #BONUS: flash message that indicates user does not exist or email/password is invalid
      end
  end

  # LOGOUT session
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
