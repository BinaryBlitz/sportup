require 'test_helper'

class API::SportTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sport_type = sport_types(:sport_type)
  end

  test 'should get index' do
    get api_sport_types_path(api_token: api_token)
    assert_response :success
  end
end
