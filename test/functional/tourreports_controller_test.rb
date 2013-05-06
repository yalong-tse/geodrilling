require 'test_helper'

class TourreportsControllerTest < ActionController::TestCase
  setup do
    @tourreport = tourreports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tourreports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tourreport" do
    assert_difference('Tourreport.count') do
      post :create, tourreport: { administrator: @tourreport.administrator, finishtime: @tourreport.finishtime, holeid: @tourreport.holeid, recorder: @tourreport.recorder, remark: @tourreport.remark, starttime: @tourreport.starttime, tourauiliarytime: @tourreport.tourauiliarytime, tourcore: @tourreport.tourcore, tourdate: @tourreport.tourdate, tourdrillingtime: @tourreport.tourdrillingtime, tourleader: @tourreport.tourleader, tourshift: @tourreport.tourshift }
    end

    assert_redirected_to tourreport_path(assigns(:tourreport))
  end

  test "should show tourreport" do
    get :show, id: @tourreport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tourreport
    assert_response :success
  end

  test "should update tourreport" do
    put :update, id: @tourreport, tourreport: { administrator: @tourreport.administrator, finishtime: @tourreport.finishtime, holeid: @tourreport.holeid, recorder: @tourreport.recorder, remark: @tourreport.remark, starttime: @tourreport.starttime, tourauiliarytime: @tourreport.tourauiliarytime, tourcore: @tourreport.tourcore, tourdate: @tourreport.tourdate, tourdrillingtime: @tourreport.tourdrillingtime, tourleader: @tourreport.tourleader, tourshift: @tourreport.tourshift }
    assert_redirected_to tourreport_path(assigns(:tourreport))
  end

  test "should destroy tourreport" do
    assert_difference('Tourreport.count', -1) do
      delete :destroy, id: @tourreport
    end

    assert_redirected_to tourreports_path
  end
end
