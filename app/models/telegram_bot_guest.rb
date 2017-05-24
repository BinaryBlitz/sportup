class TelegramBotGuest < TelegramBot
  self.table_name = 'guests'

  belongs_to :event, class_name: 'TelegramBotEvent', foreign_key: 'event_id'
  belongs_to :user, class_name: 'TelegramBotUser', foreign_key: 'user_id'

  after_create :send_participation_message

  private

  def send_participation_message
    send_message(
      event.chat.chat_id,
      "#{I18n.t('guest')} #{user.name} #{I18n.t('entered_from_app')}. " \
      "#{I18n.t('participates')} #{event.members_count}/#{event.user_limit}",
      event.chat.language
    )
  end
end
