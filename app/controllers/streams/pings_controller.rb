module Streams
  class PingsController < ApplicationController
    def create
      Stream.find(params.fetch(:stream_id)).broadcast
      head :no_content
    end
  end
end
