json.array!(@teams) do |team|
  json.extract! team, :id, :created_at

  json.event do
    json.partial! 'api/users/user', user: team.user
  end
end
