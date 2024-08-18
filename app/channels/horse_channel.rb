# app/channels/horse_channel.rb
class HorseChannel < ApplicationCable::Channel
  def subscribed
    stream_from "horses"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
