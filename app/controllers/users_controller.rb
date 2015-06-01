class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new user_params
    @user.save
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destory
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
