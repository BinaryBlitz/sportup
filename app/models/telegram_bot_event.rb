class TelegramBotEvent < TelegramBot
  self.table_name = 'events'

  default_scope { where(closed: false) }

  belongs_to :chat, class_name: 'TelegramBotChat', foreign_key: 'chat_id'
end
