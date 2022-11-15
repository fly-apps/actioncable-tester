module Streams
  class SequencesController < ApplicationController
    BATCH_SIZE = 1_000

    def create
      batch_id = SecureRandom.hex

      Integer(params.fetch(:batch_size, BATCH_SIZE)).times do |n|
        Stream.find(params.fetch(:stream_id)).broadcast(body: "Batch: #{batch_id}, Message: #{n}, Time: #{Time.now.utc}")
      end

      head :no_content
    end
  end
end
