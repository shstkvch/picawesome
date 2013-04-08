class Stream < ActiveRecord::Base
  attr_accessible :slug, :upvote_copy, :downvote_copy, :background_color, :nsfw

  has_many :pics
end
