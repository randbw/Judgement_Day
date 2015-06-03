# == Schema Information
#
# Table name: arguments
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  content         :text
#  voting_complete :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

class Argument < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  def for
    votes = 0
    self.votes.each do |v|
      if v.agree
        votes += 1
      end
    end
    votes
  end

  def against
    votes = 0
    self.votes.each do |v|
      unless v.agree
        votes += 1
      end
    end
    votes
  end

  def argument_voted_with
    with = argument.for
    against = argument.against
    if with > against
      true
    elsif against > with
      false
    elsif with == against
      return "Draw!"
    end
  end

  def complete?
    if voting_complete
      'Yes'
    elsif !voting_complete
      'No'
    end
  end
      
end