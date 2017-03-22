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

  scope :violated, -> { where(violation: true) }
end
