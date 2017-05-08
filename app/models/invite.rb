# == Schema Information
#
# Table name: invites
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  accepted   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, presence: true
  validate :not_member
  validate :event_date_valid, on: :create

  scope :unreviewed, -> { where(accepted: nil) }

  def accept
    if event.users.include?(user)
      destroy
    else
      update!(accepted: true)
      user.events << event
      create_bot_guest
    end
  end

  private

  def create_bot_guest
    return unless event.chat_id.present?
    TelegramBotGuest.create(
      user_id: TelegramBotUser.find_or_create(user).id, from_app: true,
      event_id: TelegramBotEvent.find_by_chat_id(event.chat_id).id
    )
  end

  def not_member
    return unless event.users.include?(user)
    errors.add(:user, 'is already a member')
  end

  def event_date_valid
    return unless event.starts_at && event.starts_at <= Time.zone.now
    errors.add(:event, 'has already started')
  end
end
