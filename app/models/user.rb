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
