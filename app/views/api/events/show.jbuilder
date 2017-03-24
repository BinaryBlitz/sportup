json.extract! @event,
              :id, :name, :starts_at, :ends_at, :address, :latitude, :longitude,
              :user_limit, :team_limit, :description, :price, :password

json.user_count @event.users.count

json.creator do
  json.partial! 'api/users/user', user: @event.creator
end

json.membership do
  membership = @event.memberships.find_by(user: current_user)
  json.extract! membership, :id, :event_id, :user_id if membership
end
