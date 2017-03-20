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

  test 'should create team' do
    @team.destroy

    assert_difference 'Team.count' do
      post api_event_teams_url(@event, api_token: api_token), params: {
        team: @team.attributes
      }
    end

    assert_response :created
  end

  test 'should update team' do
    new_team_number = 2
    patch api_team_path(@team, api_token: api_token), params: { team: { number: new_team_number } }
    assert_response :ok
    assert_equal new_team_number, @team.reload.number
  end

  test 'should destroy team' do
    assert_difference 'Team.count', -1 do
      delete api_team_url(@team, api_token: api_token)
    end

    assert_response :no_content
  end

end
