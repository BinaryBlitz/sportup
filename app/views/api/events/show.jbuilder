json.extract! @event,
              :id, :name, :starts_at, :ends_at, :address, :latitude, :longitude,
              :user_limit, :team_limit, :description, :price, :password

json.creator do
  json.partial! 'api/users/user', user: @event.creator
end

json.invite do
  invite = @event.invites.find_by(user: current_user)
  json.extract! invite, :id, :event_id, :user_id, :accepted, :created_at if invite
end
