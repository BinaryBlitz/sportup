class TelegramBotEvent < TelegramBot
  self.table_name = 'events'

  default_scope { where(closed: false) }

  belongs_to :chat, class_name: 'TelegramBotChat', foreign_key: 'chat_id'

  has_many :users, through: :memberships
  has_many :memberships, class_name: 'TelegramBotMembership', foreign_key: 'event_id'
  has_many :guests, class_name: 'TelegramBotGuest', foreign_key: 'event_id', dependent: :destroy

  def members_count
    users.count + guests.count
  end
end
