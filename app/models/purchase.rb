# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  receipt    :json             not null
#  platform   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Purchase < ApplicationRecord
  enum tickets: {
    'ru.binaryblitz.one-ticket': 1,
    'ru.binaryblitz.five-tickets': 5,
    'ru.binaryblitz.ten-tickets': 10
  }

  belongs_to :user

  validates :platform, presence: true, inclusion: { in: %w(android ios) }

  after_create :set_balance

  def self.tickets_list
    tickets.map { |k,v| { bundle_identifier: k, tickets_count: v } }
  end

  private

  def set_balance
    user.add_balance(tickets[bundle_id])
  end

  def bundle_id
    receipt['bundle_id'] || receipt['packageName']
  end
end
