class User < ActiveRecord::Base
  attr_accessible :username

  has_many :items
  has_many :votes
end
