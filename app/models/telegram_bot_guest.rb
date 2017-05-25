class TelegramBotGuest < TelegramBot
  self.table_name = 'guests'

  include Messageable

  belongs_to :event, class_name: 'TelegramBotEvent', foreign_key: 'event_id'
  belongs_to :user, class_name: 'TelegramBotUser', foreign_key: 'user_id'

  def message_text
    "#{I18n.t('guest')} #{user.name} #{I18n.t('entered_from_app')}. " \
    "#{I18n.t('participates')} #{event.members_count}/#{event.user_limit}"
  end
end
