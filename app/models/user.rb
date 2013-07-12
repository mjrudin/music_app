class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token

  validates :email, :password, presence: true
  validates :email, uniqueness: true


end
