# == Schema Information
#
# Table name: reports
#
#  id               :integer          not null, primary key
#  content          :string
#  violation        :boolean          default("false")
#  event_id         :integer
#  user_id          :integer
#  reported_user_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:report)
  end

  test 'valid' do
    assert @report.valid?
  end
end
