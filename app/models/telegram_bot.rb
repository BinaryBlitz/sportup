class TelegramBot < ApplicationRecord
  establish_connection(ENV['HEROKU_POSTGRESQL_YELLOW_URL'])
end
