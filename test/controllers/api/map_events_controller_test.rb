require 'test_helper'

class API::MapEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @map_event = events(:event)
  end

  test 'should get index' do
    get api_map_events_path(api_token: api_token)
    assert_response :success
  end
end
