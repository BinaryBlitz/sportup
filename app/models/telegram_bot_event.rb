class TelegramBotEvent < TelegramBot
  self.table_name = 'events'

  default_scope { where(closed: false) }
end
