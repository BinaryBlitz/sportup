json.partial! 'event', event: @event

json.creator do
  json.partial! 'api/users/user', user: @event.creator
end

json.membership do
  membership = @event.memberships.find_by(user: current_user)
  json.extract! membership, :id, :event_id, :user_id if membership
end
