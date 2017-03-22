require 'test_helper'

class API::ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:report)
    @event = @report.event
  end

  test 'should get index' do
    get api_event_reports_path(@event, api_token: api_token)
    assert_response :success
  end

  test 'should create report' do
    @report.destroy

    assert_difference 'Report.count' do
      post api_event_reports_url(@event, api_token: api_token), params: {
        reports: [@report.attributes]
      }
    end

    assert_response :created
  end
end
