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
end
