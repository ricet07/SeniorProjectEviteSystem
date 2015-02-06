require 'test_helper'

class PotlucksControllerTest < ActionController::TestCase
  setup do
    @potluck = potlucks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:potlucks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create potluck" do
    assert_difference('Potluck.count') do
      post :create, potluck: { event_id: @potluck.event_id, guest_id: @potluck.guest_id, item: @potluck.item }
    end

    assert_redirected_to potluck_path(assigns(:potluck))
  end

  test "should show potluck" do
    get :show, id: @potluck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @potluck
    assert_response :success
  end

  test "should update potluck" do
    put :update, id: @potluck, potluck: { event_id: @potluck.event_id, guest_id: @potluck.guest_id, item: @potluck.item }
    assert_redirected_to potluck_path(assigns(:potluck))
  end

  test "should destroy potluck" do
    assert_difference('Potluck.count', -1) do
      delete :destroy, id: @potluck
    end

    assert_redirected_to potlucks_path
  end
end
