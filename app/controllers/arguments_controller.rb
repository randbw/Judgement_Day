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

  def edit
  end

  def show
    @argument = Argument.find params[:id]
  end

  def update
  end

  def destroy
    @argument = Argument.find params[:id]
    @argument.destroy
    redirect_to :back
  end

  private
  def argument_params
    params.require(:argument).permit(:user_id,:content,:title)
  end
end
