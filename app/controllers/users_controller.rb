class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.create user_params
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find params[:id]
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
