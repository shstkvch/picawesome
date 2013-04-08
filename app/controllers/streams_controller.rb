class StreamsController < ApplicationController
  def show
    @stream = Stream.find_by_slug(params[:stream])
  end
  def all
    @stream
  end
end
