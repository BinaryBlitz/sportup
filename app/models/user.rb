# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  phone_number :string           not null
#  avatar       :string
#  api_token    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  include Phonable

  has_many :owned_events, dependent: :destroy, foreign_key: :creator_id, class_name: 'Event'
  has_many :memberships, dependent: :destroy
  has_many :events, through: :memberships
  has_many :invites, dependent: :destroy
  has_many :teams, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :phone_number, uniqueness: true


  has_secure_token :api_token

  def full_name
    "#{first_name} #{last_name}"
  end

  mount_uploader :avatar, AvatarUploader
end
