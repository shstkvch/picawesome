class Shortlink < ActiveRecord::Base
  attr_accessible :slug, :reference, as: :admin
  validates_uniqueness_of :slug
  validates_presence_of :slug, :reference

  def increment_view_count!
    Shortlink.increment_counter :counter, self.id
  end

  def short_url
    return nil if new_record?
    "http://pcws.me/~" + slug
  end
end
