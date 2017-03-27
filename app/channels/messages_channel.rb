class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "events:#{params[:event_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
