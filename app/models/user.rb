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

  validates :first_name, :last_name, presence: true
  validates :phone_number, uniqueness: true

  has_secure_token :api_token

  def full_name
    "#{first_name} #{last_name}"
  end

  mount_uploader :avatar, AvatarUploader
end
