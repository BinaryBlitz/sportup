# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  event_id      :integer
#  voted_user_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :voted_user, class_name: 'User', counter_cache: true

  validates :user, presence: true
  validates :voted_user, presence: true
  validates :event, presence: true, uniqueness: { scope: :user }
  validate :user_membership
  validate :voted_user_membership
  validate :not_self

  private

  def user_membership
    return if event.users.include?(user)
    errors.add(:user, 'is not a member')
  end

  def voted_user_membership
    return if event.users.include?(voted_user)
    errors.add(:voted_user, 'is not a member')
  end

  def not_self
    return unless user == voted_user
    errors.add(:user, "can't vote for yourself")
  end
end
