require 'test_helper'

class API::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:message)
    @event = @message.event
  end

  test 'should get index' do
    get api_event_messages_path(@event, api_token: api_token)
    assert_response :success
  end

  test 'should create message' do
    @message.destroy

    assert_difference 'Message.count' do
      post api_event_messages_url(@event, api_token: api_token), params: {
        message: @message.attributes
      }
    end

    assert_response :created
  end
end
