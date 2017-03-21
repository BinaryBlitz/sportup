# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  starts_at     :datetime         not null
#  ends_at       :time             not null
#  address       :string           not null
#  latitude      :float            not null
#  longitude     :float            not null
#  user_limit    :integer          not null
#  team_limit    :integer          not null
#  public        :boolean          default("true")
#  description   :text             not null
#  price         :integer          not null
#  sport_type_id :integer
#  creator_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :sport_type, counter_cache: true

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :invites, dependent: :destroy
  has_many :teams, dependent: :destroy

  scope :on_date, -> (date) { where(starts_at: (date.beginning_of_day)..(date.end_of_day)) }

  validates :name, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :latitude, inclusion: { in: -90..90 }
  validates :longitude, inclusion: { in: -180..180 }
  validates :user_limit, numericality: { greater_than: 1 }
  validates :team_limit, numericality: { greater_than: 1 }
  validates :price, numericality: { greater_than: 0 }
end
