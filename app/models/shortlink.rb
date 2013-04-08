class Shortlink < ActiveRecord::Base
  attr_accessible :slug, :reference

  def increment_view_count!
    Shortlink.increment_counter :counter, self.id
  end

  def long_url
    return '/' if reference.nil? # Necessary because the Shortlink needs to be inserted before we have a pic ref
    if reference.match(/^https?:\/\/.+/)
      reference
    else
      "/" + reference
    end
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
