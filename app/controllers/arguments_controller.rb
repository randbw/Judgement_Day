class ArgumentsController < ApplicationController
  def index
    @arguments = Argument.all
  end

  def create
    argument = Argument.create argument_params
    @current_user.arguments << argument
    redirect_to root_path
  end

  def new
    @argument = Argument.new
  end

  def show
    @argument = Argument.find params[:id]
  end

  def destroy
    @argument = Argument.find params[:id]
    @argument.destroy
    redirect_to :back
  end

  def for
    @argument = Argument.find params[:id]
    @argument.votes.create :agree => true, :user_id => @current_user.id
    # @argument.votes.where(:user_id => @current_user.id).count > 1
    redirect_to @argument
  end

  def against
    @argument = Argument.find params[:id]
    @argument.votes.create :user_id => @current_user.id
    redirect_to @argument
  end

  private
  def argument_params
    params.require(:argument).permit(:user_id,:content,:title)
  end
end
