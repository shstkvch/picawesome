class PicsController < ApplicationController
  before_filter :authenticate_user!, only: [:vote]

  def show
    @pic = Pic.find_by_id!(params[:pic])
    redirect_to "/#{params[:pic]}" unless params[:stream] == @pic.stream.slug
    redirect_to "/#{params[:pic]}" unless params[:title] and params[:title] == @pic.url_title
  end

  def stream
    @stream = Stream.find_by_slug!(params[:stream])
  end

  def all
    @pics = Pic.all
  end

  def vote
    @pic = Pic.find_by_id!(params[:pic])
    @pic.cast_vote(current_user, params[:value].to_bool)

    respond_to do |format|
      format.html { redirect_to root_path } # Todo: should redirect to pic but path helper is borked
      format.js { render json: @pic.vote_summary }
    end
  end
end
