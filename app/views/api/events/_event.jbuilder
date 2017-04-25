json.extract! event,
              :id, :name, :starts_at, :ends_at, :address, :user_limit, :description, :team_limit,
              :public, :price, :longitude, :latitude, :password, :sport_type_id

json.user_count event.users.count
