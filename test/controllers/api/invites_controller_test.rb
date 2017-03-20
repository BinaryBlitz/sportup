require 'test_helper'

class API::InvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invite = invites(:invite)
    @event = @invite.event
  end

  test 'should get index' do
    get api_invites_path(api_token: api_token)
    assert_response :success
  end

  test 'should create invite' do
    @invite.destroy

    assert_difference 'Invite.count' do
      post api_event_invites_url(@event, api_token: api_token), params: {
        invite: @invite.attributes
      }
    end

    assert_response :created
  end

  test 'should destroy invite' do
    assert_difference 'Invite.count', -1 do
      delete api_invite_url(@invite, api_token: api_token)
    end

    assert_response :no_content
  end
end
