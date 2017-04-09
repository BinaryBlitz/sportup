require 'test_helper'

class API::TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
    @event = events(:event)
    @team = @event.member(@user)
  end

  test 'should join team' do
    post api_event_teams_url(@event, api_token: api_token), params: {
      team_number: 1
    }

    assert_response :created
  end

  test 'should leave team' do
    patch api_event_team_path(@event, @team, api_token: api_token)
    assert_response :ok
    assert_equal nil, @team.team_number
  end
end
