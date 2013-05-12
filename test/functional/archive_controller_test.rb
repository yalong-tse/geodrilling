require 'test_helper'

class ArchiveControllerTest < ActionController::TestCase
  test "should get contract" do
    get :contract
    assert_response :success
  end

  test "should get hole" do
    get :hole
    assert_response :success
  end

  test "should get tourreport" do
    get :tourreport
    assert_response :success
  end

end
