require 'test_helper'

class API::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:event)
    @sport_type = @event.sport_type
  end

  test 'should get index' do
    get api_sport_type_events_url(@sport_type)
    assert_response :success
  end

  test 'should get show' do
    get api_event_path(@event, api_token: api_token)
    assert_response :success
  end

  test 'should create event' do
    @event.destroy

    assert_difference 'Event.count' do
      post api_events_url(api_token: api_token), params: { event: @event.attributes }
    end

    assert_response :created
  end

  test 'should update event' do
    new_name = 'Another name'
    patch api_event_path(@event, api_token: api_token), params: { event: { name: new_name } }
    assert_response :ok
    assert_equal new_name, @event.reload.name
  end
end
