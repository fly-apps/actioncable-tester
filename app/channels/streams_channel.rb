class StreamsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "streams_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
