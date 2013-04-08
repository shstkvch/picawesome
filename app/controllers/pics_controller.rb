class PicsController < ApplicationController
  def show
    @pic = Pic.find_by_id(params[:pic])
  end
end
