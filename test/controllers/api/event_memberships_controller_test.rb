require 'test_helper'

class API::EventMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership = memberships(:membership)
    @event = @membership.event
  end

  test 'should get index' do
    get api_event_memberships_path(@event, api_token: api_token)
    assert_response :success
  end

  test 'should create membership' do
    @membership.destroy

    assert_difference 'Membership.count' do
      post api_event_memberships_url(@event, api_token: api_token), params: {
        memberships: @membership.attributes
      }
    end

    assert_response :created
  end
end
