class RedirectsController < ApplicationController
  def pic
    @pic = Pic.find_by_id!(params[:pic])
    redirect_to "/#{@pic.stream.slug}/#{@pic.id}" # ugh pic_path helper doesn't work because we're using a stream slug, not ID
  end
end
