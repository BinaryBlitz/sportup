# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  setup do
    @team = teams(:team)
  end

  test 'valid' do
    assert @team.valid?
  end
end
