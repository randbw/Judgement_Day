# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  has_many :arguments, :dependent => :destroy
  has_secure_password

  def votes_correct
    vote_count = 0
    self.votes.each do |v|
      if v.argument.voting_complete
        correct = v.argument.argument_voted_with
        if correct && v.agree
          vote_count += 1
        elsif !correct && !v.agree
          vote_count += 1
        end
      end
    end
    vote_count
  end

  def arguments_won
    argument_count = 0
    self.arguments.each do |a|
      if a.voting_complete
        if a.argument_voted_with
          argument_count += 1
        end
      end
    end
    argument_count
  end

  def vote_master
    vote_total = self.votes.count
    vote_correct = self.votes_correct

    if vote_total > 0
      if vote_correct == vote_total && vote_total > 1
        return "Listen to #{self.username}'s opinion on all matters"
      elsif vote_correct > (vote_total / 2)
        return "Critical thinker"
      elsif vote_correct <= (vote_total / 2)
        return "Disagree with me regularly or I will bring your intelligence down"
      elsif vote_correct == 0
        return "Ignore everything that comes from my mouth"
      end
    elsif vote_total == 0
      return "Indecisive fool"
    end
  end

  def argument_master

  end

end

























