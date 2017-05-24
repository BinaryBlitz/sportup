require 'telegram/bot'

class TelegramBot < ApplicationRecord
  establish_connection(ENV['HEROKU_POSTGRESQL_YELLOW_URL'])

  def send_message(chat_id, text, locale)
    I18n.locale = locale.to_sym

    Telegram::Bot::Client.run(Rails.application.secrets.bot_token) do |bot|
      bot.api.send_message(chat_id: chat_id, text: text)
    end
  end
end
