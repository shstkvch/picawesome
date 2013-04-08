class Item < ActiveRecord::Base
  attr_accessible :caption, :attribution

  belongs_to :stream
  has_many :votes
end
