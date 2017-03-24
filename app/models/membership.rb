# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :event, counter_cache: true

  validates :user, presence: true
  validates :event, presence: true, uniqueness: { scope: :user }
end
