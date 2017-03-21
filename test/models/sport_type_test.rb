# == Schema Information
#
# Table name: sport_types
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  color        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  icon         :string           not null
#  events_count :integer          default("0")
#

require 'test_helper'

class SportTypeTest < ActiveSupport::TestCase
  setup do
    @sport_type = sport_types(:sport_type)
  end

  test 'invalid without name' do
    @sport_type.name = nil
    assert @sport_type.invalid?
  end
end
