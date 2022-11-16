class Stream
  include ActiveModel::API

  attr_accessor :uid

  def to_param
    uid
  end

  def persisted?
    true
  end

  def broadcast(body: self.class.generate_message)
    Turbo::StreamsChannel.broadcast_prepend_to \
      channel_name,
      target: channel_name,
      partial: "streams/message",
      locals: { stream: self, body: body }
  end

  def channel_name
    "streams_#{to_param}"
  end

  class << self
    def find(uid)
      new uid: uid
    end

    def generate_message
      "The time is #{Time.current.utc}"
    end

    def generate_uid
      SecureRandom.hex
    end

    def create
      new(uid: generate_uid)
    end

    # Handy for copying the URL of a stream from the browser into the console.
    def from_url(url)
      case File.split URI(url).path
        in ["/streams", uid]
          find uid
      end
    end
  end
end
