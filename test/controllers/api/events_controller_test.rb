require 'test_helper'

class API::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:event)
    @private_event = events(:private_event)
    @unknown_user = users(:baz)
    @sport_type = @event.sport_type
    @city = @event.city
  end

  test 'should get index' do
    get api_city_sport_type_events_url(@city, @sport_type)
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

  test 'should destroy event' do
    assert_difference 'Event.count', -1 do
      delete api_event_url(@event, api_token: api_token)
    end

    assert_response :no_content
  end

  test 'creator should get show without password' do
    get api_event_path(@private_event, api_token: api_token)
    assert_response :success
  end

  test 'should not get show without password' do
    get api_event_path(@private_event, api_token: @unknown_user.api_token)
    assert_response :forbidden
  end

  test 'should get show with password' do
    get api_event_path(
      @private_event, api_token: @unknown_user.api_token, password: @private_event.password
    )
    assert_response :success
  end
end
