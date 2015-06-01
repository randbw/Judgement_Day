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
    count_votes
  end

  def update
  end

  def destroy
  end

  private
  def argument_params
    params.require(:argument).permit(:user_id,:content)
  end

  def count_votes
    @vote_for = 0
    @vote_against = 0
    votes = @argument.votes
    votes.each do |v|
      if v.agree
        @vote_for += 1
      elsif !v.agree
        @vote_against += 1
      end
  end
  end
end
