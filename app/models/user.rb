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
  has_many :votes#, :dependent => :destroy
  has_many :arguments#, :dependent => :destroy
  has_secure_password


  
end
