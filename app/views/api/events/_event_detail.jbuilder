json.partial! 'api/events/event', event: event

json.sport_type do
  json.extract! event.sport_type, :id, :name, :color, :icon_url
end

json.creator do
  json.extract! event.creator, :id, :first_name, :last_name, :avatar_url
end
