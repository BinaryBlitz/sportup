require 'test_helper'

class API::MapEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @map_event = events(:event)
    @sport_type = @map_event.sport_type
  end

  test 'should get index' do
    get api_sport_type_map_events_path(@sport_type)
    assert_response :success
  end
end
