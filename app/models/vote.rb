# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  agree       :boolean          default(FALSE)
#  user_id     :integer
#  argument_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :argument
end
