require 'test_helper'

class API::MembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership = memberships(:membership)
  end

  test 'should get index' do
    get api_memberships_url(api_token: api_token)
    assert_response :success
  end

  test 'should destroy membership' do
    assert_difference 'Membership.count', -1 do
      delete api_membership_url(@membership, api_token: api_token)
    end

    assert_response :no_content
  end
end
