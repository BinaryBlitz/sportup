# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  starts_at         :datetime         not null
#  ends_at           :time             not null
#  address           :string           not null
#  latitude          :float            not null
#  longitude         :float            not null
#  user_limit        :integer          not null
#  team_limit        :integer          not null
#  public            :boolean          default("true")
#  description       :text
#  price             :integer          not null
#  sport_type_id     :integer
#  creator_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  password          :string
#  memberships_count :integer          default("0")
#  chat_id           :string
#

class Event < ApplicationRecord
  SEARCH_RADIUS = 30

  after_create :attend

  belongs_to :creator, class_name: 'User'
  belongs_to :sport_type

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :invites, dependent: :destroy
  has_many :voted_users, through: :votes
  has_many :votes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :messages, dependent: :destroy

  geocoded_by :address

  scope :on_date, -> (date) { where(starts_at: (date.beginning_of_day)..(date.end_of_day)) }
  scope :past_events, -> { where('cast(starts_at as date) + ends_at < ?', Time.zone.now) }
  scope :by_location, -> (location) { near(location, SEARCH_RADIUS, units: :km) }

  validates :name, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :address, presence: true
  validates :latitude, inclusion: { in: -90..90 }
  validates :longitude, inclusion: { in: -180..180 }
  validates :user_limit, numericality: { greater_than: 1 }
  validates :team_limit, numericality: { greater_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validate :starts_before_ends

  def verify(user, password)
    return true if public? || user == creator || member(user)
    self.password == password
  end

  def member(user)
    memberships.where(user: user).first
  end

  def datetime_of_ending
    starts_at.to_date + ends_at.seconds_since_midnight.seconds
  end

  private

  def attend
    creator.events << self
  end

  def starts_before_ends
    return unless starts_at > datetime_of_ending
    errors.add(:event, 'should starts before ends')
  end
end
