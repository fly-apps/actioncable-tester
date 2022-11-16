module Streams
  class PingsController < ApplicationController
    def create
      # Create a "Ping" record and mark the `start_time`
      Stream.find(params.fetch(:stream_id)).broadcast
      head :no_content
    end
  end
end
