json.partial! 'user', user: @user

json.votes_count @user.votes_count
json.violations_count @user.violations_count
json.events_count @user.events_count
