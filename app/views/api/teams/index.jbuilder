json.array!(@teams) do |team|
  json.extract! team, :id, :created_at

  json.user do
    json.partial! 'api/users/user', user: team.user
  end
end
