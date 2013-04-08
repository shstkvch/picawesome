class Stream < ActiveRecord::Base
  attr_accessible :slug, :upvote_copy, :downvote_copy, :background_color, :nsfw
  validates :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  validates_format_of :slug, with: /\A[a-z]\w+\z/

  has_many :pics
end
