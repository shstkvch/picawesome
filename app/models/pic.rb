class Pic < ActiveRecord::Base
  attr_accessible :caption, :attribution

  nilify_blanks

  belongs_to :user
  belongs_to :stream
  has_many :votes

  def url_title
    return caption.gsub(/\W/, '_').gsub(/_{2,}/, '_')[0,25]
  end

  def user_upvoted?(user)
    return false if user.nil?
    return !votes.where(user_id: user.id, value: true).empty?
  end
  def user_downvoted?(user)
    return false if user.nil?
    return !votes.where(user_id: user.id, value: false).empty?
  end

  def cast_vote(user, value)
    vote = Vote.where(pic_id: id, user_id: user.id).first
    if vote
      vote.value = value
      vote.save
    else
      vote = Vote.new
      vote.user  = user
      vote.value = value
      vote.pic   = self
      vote.save
    end
  end

  def vote_summary
    {
      upvote: {
        count: upvote_count,
        percentage: upvote_percentage
      },
      downvote: {
        count: downvote_count,
        percentage: downvote_percentage
      }
    }
  end

  def upvote_count
    votes.where(value: true).count
  end
  def downvote_count
    votes.where(value: false).count
  end

  def upvote_percentage
    (upvote_count.to_f   / votes.count.to_f * 100.to_f).to_s + "%"
  end
  def downvote_percentage
    (downvote_count.to_f / votes.count.to_f * 100.to_f).to_s + "%"
  end
end
