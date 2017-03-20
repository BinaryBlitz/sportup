# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :event, presence: true
  validates :user, presence: true, uniqueness: { scope: :event }
  validates :number, numericality: { greater_than_or_equal_to: 1 }

end
