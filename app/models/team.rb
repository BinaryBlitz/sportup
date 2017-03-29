# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
  belongs_to :event

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  validates :event, presence: true
  validates :number, numericality: { greater_than_or_equal_to: 1 }
end
