json.array!(@teams) do |team|
  json.extract! team, :id, :number

  json.users team.users do |user|
    json.partial! 'api/users/user', user: user
  end
end
