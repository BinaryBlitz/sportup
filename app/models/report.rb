# == Schema Information
#
# Table name: reports
#
#  id               :integer          not null, primary key
#  content          :string
#  violation        :boolean          default("false")
#  event_id         :integer
#  user_id          :integer
#  reported_user_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :reported_user, class_name: 'User'

  validates :user, presence: true
  validates :reported_user, presence: true
  validates :event, presence: true, uniqueness: { scope: :reported_user }
  validate :user_membership
  validate :reported_user_membership
  validate :not_self

  after_save :update_counter_cache

  scope :violated, -> { where(violation: true) }

  private

  def update_counter_cache
    reported_user.update_column(:violations_count, reported_user.reports.violated.count)
  end

  def user_membership
    return if event.users.include?(user)
    errors.add(:user, 'is not a member')
  end

  def reported_user_membership
    return if event.users.include?(reported_user)
    errors.add(:reported_user, 'is not a member')
  end

  def not_self
    return unless user == reported_user
    errors.add(:user, "can't report yourself")
  end
end
