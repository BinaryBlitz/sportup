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

  def accept
    if event.users.include?(user)
      destroy
    else
      update!(accepted: true)
      user.events << event
    end
  end

  private

  def not_member
    return unless event.users.include?(user)
    errors.add(:user, 'is already a member')
  end

  def event_date_valid
    return unless event.starts_at && event.starts_at <= Time.zone.now
    errors.add(:event, 'has already started')
  end
end
