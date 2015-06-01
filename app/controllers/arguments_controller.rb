class ArgumentsController < ApplicationController
  def index
    @arguments = Argument.all
  end

  def create
    @argument = Argument.create argument_params
    redirect_to root_path
  end

  def new
    @argument = Argument.new
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
  def argument_params
    params.require(:argument).permit(:user_id,:content)
  end

end
