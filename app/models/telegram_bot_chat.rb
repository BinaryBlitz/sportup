class TelegramBotChat < TelegramBot
  self.table_name = 'chats'

  has_many :events, class_name: 'TelegramBotEvent', foreign_key: 'chat_id'
end
