require 'test_helper'

class API::JoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join = joins(:join)
    @team = @join.team
  end

  test 'should create join' do
    @join.destroy

    assert_difference 'Join.count' do
      post api_team_joins_url(@team, api_token: api_token), params: {
        join: @join.attributes
      }
    end

    assert_response :created
  end

  test 'should destroy join' do
    assert_difference 'Join.count', -1 do
      delete api_join_url(@join, api_token: api_token)
    end

    assert_response :no_content
  end
end
