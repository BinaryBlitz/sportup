json.array!(@memberships) do |membership|
  json.extract! membership, :id, :event_id

  json.user do
    json.partial! 'api/users/user', user: membership.user

    json.votes_count membership.user.votes.where(event: membership.event).count
    json.violations_count membership.user.reports.where(event: membership.event).violated.count
  end
end
