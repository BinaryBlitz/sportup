# == Schema Information
#
# Table name: memberships
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  event_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_number :integer
#

require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  setup do
    @membership = memberships(:membership)
  end

  test 'valid' do
    assert @membership.valid?
  end
end
