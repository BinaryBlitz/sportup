class TelegramBotUser < TelegramBot
  self.table_name = 'users'

  has_many :events, through: :memberships, source: :telegram_bot_memberships
  has_many :memberships, class_name: 'TelegramBotMembership', foreign_key: 'user_id'

  def self.find_or_create(user)
    find_or_create_by(telegram_id: user.telegram_id) do |bot_user|
      bot_user.first_name = user.first_name
      bot_user.last_name = user.last_name
    end
  end

  def name
    username || first_name
  end
end
