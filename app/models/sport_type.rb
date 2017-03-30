# == Schema Information
#
# Table name: sport_types
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  color        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  icon         :string           not null
#  events_count :integer          default("0")
#

class SportType < ApplicationRecord
  COLOR_HEX_FORMAT = /\A#(?:[A-F0-9]{3}){1,2}\z/i

  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :color, format: { with: COLOR_HEX_FORMAT }

  before_validation -> { color.downcase! if color.present? }

  scope :by_city, -> (city) { joins(:events).where('events.city_id': city.id).distinct }

  mount_uploader :icon, IconUploader
end
