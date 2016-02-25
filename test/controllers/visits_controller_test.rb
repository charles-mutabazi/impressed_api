require 'test_helper'

class VisitsControllerTest < ActionController::TestCase
  setup do
    @visit = visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visits)
  end

  test "should create visit" do
    assert_difference('Visit.count') do
      post :create, visit: { duration: @visit.duration, entry_time: @visit.entry_time, exit_time: @visit.exit_time }
    end

    assert_response 201
  end

  test "should show visit" do
    get :show, id: @visit
    assert_response :success
  end

  test "should update visit" do
    put :update, id: @visit, visit: { duration: @visit.duration, entry_time: @visit.entry_time, exit_time: @visit.exit_time }
    assert_response 204
  end

  test "should destroy visit" do
    assert_difference('Visit.count', -1) do
      delete :destroy, id: @visit
    end

    assert_response 204
  end
end
