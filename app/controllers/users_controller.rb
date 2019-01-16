class UsersController < ApplicationController
  # Refactoring Set Bean and Authorize
    before_action :authorize, only: [:index, :show, :edit, :update, :destroy]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  # Action to show ALL Users photos
  def index
    @users = User.all
    @posts = Post.all
  end

  # Show single User
  def show
    if params[:id].to_i == current_user.id
      current_user
    else
      redirect_to users_path, danger:  "Error! Invalid email or password!"
    end
  end

  # Form for new User
  def new
    @user = User.new
  end

  # Action to post/create new User
  def create
    @user = User.new(user_params)

    if User.find_by_email(@user.email) == true
      redirect_to new_session_path, danger: "User already exists! Please log in!"
    elsif 
      @user.save
      # authenticate(@user)
      redirect_to users_path, success: "Welcome! Your profile has successfully been created!"
    else
      render :new
    end
  end

  # Render Edit page for specific User
  def edit
    set_user
  end

  # Update specific User
  def update
    set_user

    if @user.update_attributes(user_params)
      redirect_to user_path, success: "Profile successfully updated!"
    else
      render :edit
    end
  end

  # DELETE User
  def destroy
    set_user
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, success: "Profile successfully deleted!"
  end

  # REFACTORING to make dry
  private #Everything under here is a HELPER METHOD for this controller

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end

  # def authenticate(user)
  #     @user = User.find_by_email(params[:email])
      
  #     #Check if user exists in the database... if yes, create session and redirect to user's page
  #     if @user && @user.authenticate(params[:password])
        
  #       session[:user_id] = @user.id
  #       redirect_to users_path
  #     else
  #       #If user does not exist in database, redirect to login or sign up page
  #       redirect_to new_user_path, danger: "Error! Invalid email or password!"
  #       #BONUS: flash message that indicates user does not exist or email/password is invalid
  #     end
  # end
end
