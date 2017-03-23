# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :content, presence: true
end
