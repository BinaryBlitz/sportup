json.array! @invites do |invite|
  json.extract! invite, :id

  json.event do
    json.partial! 'api/events/event_detail', event: invite.event
  end
end
