json.extract! event, :id, :name, :starts_at, :ends_at

json.sport_type do
  json.extract! event.sport_type, :id, :color, :icon_url
end

json.creator do
  json.extract! event.creator, :id, :first_name, :last_name, :avatar_url
end
