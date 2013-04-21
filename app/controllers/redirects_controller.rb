class RedirectsController < ApplicationController
  def pic
    @pic = Pic.find_by_id!(params[:pic])
    redirect_to "/#{@pic.stream.slug}/#{@pic.id}/#{@pic.url_title}" # ugh pic_path helper doesn't work because we're using a stream slug, not ID
  end

  def shortlink
    slug = params[:short]
    if params[:short].match(/^[~-].+/)
      # Custom short link

      slug[0] = ''
      if @short = Shortlink.find_by_slug(slug)
        @short.increment_view_count!
        redirect_to @short.reference
      else
        flash[:alert] = "Invalid link"
        redirect_to root_path
      end
    else
      # Regular old pic short link

      if @pic = Pic.find_by_id(Radix62.decode62(slug))
        redirect_to pic_path @pic
      else
        flash[:alert] = "Invalid link"
        redirect_to root_path
      end
    end
  end
end
