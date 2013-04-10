class RedirectsController < ApplicationController
  def pic
    @pic = Pic.find_by_id!(params[:pic])
    redirect_to "/#{@pic.stream.slug}/#{@pic.id}/#{@pic.url_title}" # ugh pic_path helper doesn't work because we're using a stream slug, not ID
  end

  def shortlink
    slug = params[:short]
    if params[:short].match(/^[~-].+/)
      slug[0] = ''
      @short = Shortlink.find_by_slug(slug)
    else
      @short = Shortlink.find_by_id(Radix62.decode62(slug))
    end

    if @short
      @short.increment_view_count!
      redirect_to @short.long_url
    else
      flash[:alert] = "Invalid link"
      redirect_to root_path
    end
  end
end
