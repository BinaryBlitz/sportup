require 'test_helper'

class API::VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote = votes(:vote)
    @event = @vote.event
  end

  test 'should create vote' do
    @vote.destroy

    assert_difference 'Vote.count' do
      post api_event_votes_url(@event, api_token: api_token), params: {
        vote: @vote.attributes
      }
    end

    assert_response :created
  end
end
