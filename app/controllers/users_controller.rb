class UsersController < ApplicationController
  def index
    users = User.all 
    @users = users.sort_by do |user|
      user.username.downcase
    end
    case params[:order]
      when 'mvp' then @users = @users.sort_by do |user|
        user.votes.count
      end.reverse
      when 'mvc' then @users = @users.sort_by do |user|
        user.votes_correct
      end.reverse
      when 'map' then @users = @users.sort_by do |user|
        user.arguments.count
      end.reverse
      when 'maw' then @users = @users.sort_by do |user|
        user.arguments_won
      end.reverse
    end

  end

  def create
   @user = User.new user_params
    if @user.save
      flash[:notice] = "Created account: #{@user.username}"
      redirect_to login_path
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
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
