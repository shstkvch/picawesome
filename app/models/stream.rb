class Stream < ActiveRecord::Base
  attr_accessible :slug, :upvote_copy, :downvote_copy, :background_color, :nsfw
  attr_accessible :slug, :upvote_copy, :downvote_copy, :background_color, :nsfw, as: :admin

  validates :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  validates_format_of :slug, with: /\A[a-zA-Z]\w+\z/
  nilify_blanks

  has_many :pics

  def to_s
    slug
  end
end
