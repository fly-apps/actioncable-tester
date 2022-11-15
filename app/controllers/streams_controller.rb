class StreamsController < ApplicationController
  def show
    @stream = Stream.new uid: params[:id]
  end

  def new
    redirect_to Stream.create
  end
end
