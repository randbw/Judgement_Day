class ArgumentsController < ApplicationController
  def index
    arguments = Argument.all
    # show them with the arguments with most votes coming first
    @arguments = arguments.sort_by do |argument|
        argument.votes.count
      end.reverse
    case params[:order]
      when 'popular' then @arguments = Argument.all.sort_by do |argument|
        argument.votes.count
        end.reverse
      when 'leastpop' then @arguments = Argument.all.sort_by do |argument|
        argument.votes.count
      end
      when 'recent' then @arguments = Argument.all.order(:created_at).reverse
      when 'earliest' then @arguments = Argument.all.order(:created_at)
      when 'voted' then @arguments = Argument.all.order(:voting_complete).reverse
      when 'notvoted' then @arguments = Argument.all.order(:voting_complete)
    end
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
    @argument.argument_over
    redirect_to @argument
  end

  def against
    @argument = Argument.find params[:id]
    @argument.votes.create :user_id => @current_user.id
    @argument.argument_over
    redirect_to @argument
  end

  private
  def argument_params
    params.require(:argument).permit(:user_id,:content,:title)
  end
end
