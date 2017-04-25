json.extract! sport_type, :id, :name, :color, :icon_url

json.events_count sport_type.events.count
