class Shortlink < ActiveRecord::Base
  scope :custom,    where("slug IS NOT NULL")
  scope :generated, where("slug IS NULL")

  attr_accessible :slug, :reference, as: :admin

  validates_uniqueness_of :slug

  def increment_view_count!
    Shortlink.increment_counter :counter, self.id
  end

  def long_url
    return "/" if reference.nil? # Necessary because the Shortlink needs to be inserted before we have a pic ref
    if is_custom?
      reference
    else
      "/" + reference
    end
  end

  def is_custom?
    !reference.match(/\d+/)
  end

  def short_url
    return nil if new_record?

    base = "http://pcws.me/"
    if slug.nil?
      base + Radix62.encode62(id)
    else
      base + "~" + slug
    end
  end
end
