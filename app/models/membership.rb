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

  def join(team_number)
    update!(team_number: team_number)
  end

  def leave
    update!(team_number: nil)
  end

  private

  def team_number_is_valid
    return unless team_number.present?

    errors.add(:team_number, 'is greater than event team limit') if team_number > event.team_limit
  end
end
