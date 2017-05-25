class TelegramBotMembership < TelegramBot
  self.table_name = 'memberships'

  include Messageable

  belongs_to :event, class_name: 'TelegramBotEvent', foreign_key: 'event_id'
  belongs_to :user, class_name: 'TelegramBotUser', foreign_key: 'user_id'

  def message_text
    "#{user.name} #{I18n.t('entered_from_app')}. " \
    "#{I18n.t('participates')} #{event.members_count}/#{event.user_limit}"
  end
end
