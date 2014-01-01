require 'test_helper'

class LeaderControllerTest < ActionController::TestCase
  test "should get holeproduct" do
    get :holeproduct
    assert_response :success
  end

  test "should get holefinish" do
    get :holefinish
    assert_response :success
  end

  test "should get contract" do
    get :contract
    assert_response :success
  end

end
