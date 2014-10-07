require 'test_helper'

class ScammersControllerTest < ActionController::TestCase
  setup do
    @scammer = scammers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scammers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scammer" do
    assert_difference('Scammer.count') do
      post :create, scammer: {  }
    end

    assert_redirected_to scammer_path(assigns(:scammer))
  end

  test "should show scammer" do
    get :show, id: @scammer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scammer
    assert_response :success
  end

  test "should update scammer" do
    patch :update, id: @scammer, scammer: {  }
    assert_redirected_to scammer_path(assigns(:scammer))
  end

  test "should destroy scammer" do
    assert_difference('Scammer.count', -1) do
      delete :destroy, id: @scammer
    end

    assert_redirected_to scammers_path
  end
end
