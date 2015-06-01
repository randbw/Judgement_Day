class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
   @user = User.new user_params
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = @current_user
  end

  def show
    @user = User.find params[:id]
  end

  def update
    user = @current_user
    user = user.update user_params
    redirect_to user_path
  end

  def destroy
    user = @current_user
    user.destroy
    @current_user = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
