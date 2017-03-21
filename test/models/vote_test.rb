# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  event_id      :integer
#  voted_user_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
 setup do
    @vote = votes(:vote)
  end

  test 'valid' do
    assert @vote.valid?
  end
end
