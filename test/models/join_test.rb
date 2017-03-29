# == Schema Information
#
# Table name: joins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class JoinTest < ActiveSupport::TestCase
  setup do
    @join = joins(:join)
  end

  test 'valid' do
    assert @join.valid?
  end
end
