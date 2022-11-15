# ./app/controllers/pings_controller.rb
class PingsController < ApplicationController
  # These helpers exist to make this demo more self-contained. In practice
  # you might use instance variables and/or view helpers.
  helper_method :start_time, :duration, :msec, :msec_between_pings

  # Time to wait between each ping.
  MSEC_BETWEEN_PINGS = 1_000

  def ping
    respond_to do |format|
      format.turbo_stream
      format.any { redirect_to pong_url(start_time) }
    end
  end

  def pong
    respond_to do |format|
      format.turbo_stream
      format.any { render plain: "#{msec duration} ms\n" }
    end
  end

  protected
    def msec_between_pings
      MSEC_BETWEEN_PINGS
    end

    def now
      usec Time.now
    end

    def usec(time)
      (time.to_i * 1_000_000) + time.usec
    end

    def msec(usec)
      usec.to_f / 1_000
    end

    def start_time
      @start_time ||= Integer params.fetch(:start_time, now)
    end

    def end_time
      @end_time ||= Integer params.fetch(:end_time, now)
    end

    def duration
      end_time - start_time
    end
end
