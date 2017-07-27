class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  # before_create :set_admin

  has_secure_password

  # def set_admin
  # 	self.admin = false
  # end

  def mood
  	self.nausea > self.happiness ? "sad" : "happy"
  end


end
