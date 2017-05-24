# == Schema Information
#
# Table name: memberships
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  event_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_number :integer
#

class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :event, counter_cache: true

  validates :user, presence: true
  validates :event, presence: true, uniqueness: { scope: :user }
  validate :team_number_is_valid

  after_create :create_bot_membership
  after_destroy :destroy_bot_membership

  def join(team_number)
    update!(team_number: team_number)
  end

  def leave
    update!(team_number: nil)
  end

  private

  def create_bot_membership
    return unless event.chat_id.present?
    TelegramBotMembership.create(
      user_id: TelegramBotUser.find_or_create(user).id, from_app: true,
      event_id: TelegramBotChat.find_by(chat_id: event.chat_id).events.first.id
    )
  end

  def destroy_bot_membership
    return unless event.chat_id || user.telegram_id
    TelegramBotMembership.where(
      event_id: TelegramBotChat.find_by(chat_id: event.chat_id).events.first.id,
      user_id: TelegramBotUser.find_by_telegram_id(user.telegram_id).id
    ).first.destroy
  end

  def team_number_is_valid
    return unless team_number.present?

    errors.add(:team_number, 'is greater than event team limit') if team_number > event.team_limit
  end
end
