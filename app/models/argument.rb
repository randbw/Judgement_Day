# == Schema Information
#
# Table name: arguments
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  content         :text
#  voting_complete :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

class Argument < ActiveRecord::Base
  belongs_to :user
  has_many :votes
end
