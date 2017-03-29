require 'test_helper'

class API::TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:team)
    @event = @team.event
  end

  test 'should get index' do
    get api_event_teams_path(@event, api_token: api_token)
    assert_response :success
  end
end
