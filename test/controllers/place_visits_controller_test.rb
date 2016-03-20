require 'test_helper'

class PlaceVisitsControllerTest < ActionController::TestCase
  setup do
    @place_visit = place_visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:place_visits)
  end

  test "should create place_visit" do
    assert_difference('PlaceVisit.count') do
      post :create, place_visit: {  }
    end

    assert_response 201
  end

  test "should show place_visit" do
    get :show, id: @place_visit
    assert_response :success
  end

  test "should update place_visit" do
    put :update, id: @place_visit, place_visit: {  }
    assert_response 204
  end

  test "should destroy place_visit" do
    assert_difference('PlaceVisit.count', -1) do
      delete :destroy, id: @place_visit
    end

    assert_response 204
  end
end
