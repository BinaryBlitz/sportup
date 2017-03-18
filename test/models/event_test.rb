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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = events(:event)
  end

  test 'valid' do
    assert @event.valid?
  end

  test 'invalid without name' do
    @event.name = nil
    assert @event.invalid?
  end

  test 'positive price' do
    @event.price = -1
    assert @event.invalid?

    @event.price = 0
    assert @event.invalid?
  end
end
