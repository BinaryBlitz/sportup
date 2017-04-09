json.array! @events do |event|
  json.partial! 'api/events/event', event: event

  json.membership do
    membership = event.memberships.find_by(user: current_user) if current_user
    json.partial! 'api/memberships/membership', membership: membership if membership
  end
end
