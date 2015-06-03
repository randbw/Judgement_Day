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
  has_many :votes, :dependent => :destroy

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
    with = self.for
    against = self.against
    if with > against
      true
    elsif against > with
      false
    end
  end

  def complete?
    if voting_complete
      'Yes'
    elsif !voting_complete
      'No'
    end
  end

  def argument_over
    # due to the low amount of users i will settle on a fixed number of votes
    # but in future would be cool, if I got the users, to have a fixed percentage
    # of total users to have voted to determine an argument as over.
    with = self.for
    against = self.against
    if with + against > 5 && with != against
      self.voting_complete = true
      self.save
    end
  end
      
end