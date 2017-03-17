# == Schema Information
#
# Table name: sport_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  color      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SportType < ApplicationRecord
  COLOR_HEX_FORMAT = /\A#(?:[A-F0-9]{3}){1,2}\z/i

  validates :name, presence: true
  validates :color, format: { with: COLOR_HEX_FORMAT }

  before_validation -> { color.downcase! if color.present? }
end
