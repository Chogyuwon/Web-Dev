class SpeakerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "speaker"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
