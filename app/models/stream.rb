class Stream < ActiveRecord::Base
  attr_accessible :slug, :upvote_copy, :downvote_copy, :background_color, :nsfw
  validates :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  # validates :slug_begins_with_letter #TODO: write this validator when you can be bothered.

  has_many :pics
end
