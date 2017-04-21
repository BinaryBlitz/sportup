json.extract! message, :id, :content, :created_at, :updated_at

json.user do
  json.extract! message.user, :id, :first_name, :last_name, :avatar_url
end
