# == Schema Information
#
# Table name: joins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Join < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :team, presence: true
  validates :user, presence: true
  validate :user_uniqueness, on: :create

  delegate :event, to: :team

  private

  def user_uniqueness
    if event.joins.where(user_id: user_id).any?
      errors.add(:user, 'is already in team')
    end
  end
end
