module Messageable
  extend ActiveSupport::Concern

  included do
    after_create :send_telegram_message
  end

  private

  def send_telegram_message
    I18n.locale = event.chat.language.to_sym
    send_message(event.chat.chat_id, message_text)
  end
end
