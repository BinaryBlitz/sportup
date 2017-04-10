require 'test_helper'

class API::EventMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership = memberships(:membership)
    @event = @membership.event
    @unknown_user = users(:baz)
    @private_event = events(:private_event)
  end

  test 'should get index' do
    get api_event_memberships_path(@event, api_token: api_token)
    assert_response :success
  end

  test 'should create membership with public event' do
    @membership.destroy

    assert_difference 'Membership.count' do
      post api_event_memberships_url(@event, api_token: api_token)
    end

    assert_response :created
  end

  test 'should not create membership without password' do
    post api_event_memberships_url(@private_event, api_token: @unknown_user.api_token)
    assert_response :forbidden
  end

  test 'should create membership with password' do
    @membership.destroy

    assert_difference 'Membership.count' do
      post api_event_memberships_url(@private_event, api_token: @unknown_user.api_token), params: {
        password: @private_event.password
      }
    end

    assert_response :created
  end
end
