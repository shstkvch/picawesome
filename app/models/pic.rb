class Pic < ActiveRecord::Base
  attr_accessible :caption, :attribution

  belongs_to :user
  belongs_to :stream
  has_many :votes

  def upvote_count
    votes.where(value: true).count
  end
  def downvote_count
    votes.where(value: false).count
  end

  def upvote_percentage
    (upvote_count   / votes.count * 100).to_s + "%"
  end
  def downvote_percentage
    (downvote_count / votes.count * 100).to_s + "%"
  end
end
