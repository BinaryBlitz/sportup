# == Schema Information
#
# Table name: invites
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  accepted   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  setup do
    @invite = invites(:invite)
  end

  test 'valid' do
    assert @invite.valid?
  end
end
