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
      
end