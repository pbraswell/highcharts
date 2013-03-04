require 'test_helper'

class MoosesControllerTest < ActionController::TestCase
  setup do
    @moose = mooses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mooses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moose" do
    assert_difference('Moose.count') do
      post :create, moose: @moose.attributes
    end

    assert_redirected_to moose_path(assigns(:moose))
  end

  test "should show moose" do
    get :show, id: @moose
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moose
    assert_response :success
  end

  test "should update moose" do
    put :update, id: @moose, moose: @moose.attributes
    assert_redirected_to moose_path(assigns(:moose))
  end

  test "should destroy moose" do
    assert_difference('Moose.count', -1) do
      delete :destroy, id: @moose
    end

    assert_redirected_to mooses_path
  end
end
