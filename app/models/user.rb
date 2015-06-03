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
end
