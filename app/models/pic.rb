class Pic < ActiveRecord::Base
  attr_accessible :caption, :attribution, :scaled_image_key, :original_image_key, :user, :user_id, :stream, :stream_id, as: :admin
  validates_presence_of :caption
  validates_presence_of :user
  validates_presence_of :stream

  nilify_blanks

  belongs_to :user
  belongs_to :stream
  has_many :votes

  def url_title
    return caption.gsub(/\W/, '_').gsub(/_{2,}/, '_')[0,25].gsub(/\A_+|_+\Z/, '')
  end

  def short_url
    return nil if new_record?
    "http://pcws.me/" + Radix62.encode62(id)
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

  def to_s
    "(#{id}) #{caption}"
  end

  def vote_summary
    {
      vote_count: vote_count,
      upvote_count: upvote_count,
      downvote_count: downvote_count
    }
  end

  def vote_count
    votes.count
  end
  def upvote_count
    votes.where(value: true).count
  end
  def downvote_count
    votes.where(value: false).count
  end

  def upvote_percentage
    return "0%" if vote_count == 0
    (upvote_count.to_f   / vote_count.to_f * 100.to_f).to_s + "%"
  end
  def downvote_percentage
    return "0%" if vote_count == 0
    (downvote_count.to_f / vote_count.to_f * 100.to_f).to_s + "%"
  end
end
