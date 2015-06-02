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
        votes +=1
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
end