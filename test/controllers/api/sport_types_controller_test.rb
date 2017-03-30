require 'test_helper'

class API::SportTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sport_type = sport_types(:sport_type)
    @city = cities(:city)
  end

  test 'should get index' do
    get api_city_sport_types_path(@city)
    assert_response :success
  end
end
