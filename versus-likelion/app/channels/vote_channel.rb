class VoteChannel < ApplicationCable::Channel
  def subscribed
    stream_from "vote"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
