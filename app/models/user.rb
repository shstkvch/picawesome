class User < ActiveRecord::Base
  attr_accessible :username

  has_many :pics
  has_many :votes
end
