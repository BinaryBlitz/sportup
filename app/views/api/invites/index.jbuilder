json.array! @invites do |invite|
  json.partial! 'api/invites/invite', invite: invite

  json.user do
    json.partial! 'api/users/user', user: invite.user
  end

  json.event do
    json.partial! 'api/events/event_detail', event: invite.event
  end
end
