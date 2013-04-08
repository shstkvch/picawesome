class User < ActiveRecord::Base
  attr_accessible :username
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }


  has_many :pics
  has_many :votes
end
