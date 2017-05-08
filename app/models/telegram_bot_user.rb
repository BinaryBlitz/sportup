class TelegramBotUser < TelegramBot
  self.table_name = 'users'

  def self.find_or_create(user)
    find_or_create_by(telegram_id: user.telegram_id) do |bot_user|
      bot_user.first_name = user.first_name
      bot_user.last_name = user.last_name
    end
  end
end
