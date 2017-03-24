json.extract! event,
              :id, :name, :starts_at, :ends_at, :address, :user_limit,
              :team_limit, :public, :price, :longitude, :latitude

json.user_count event.users.count
