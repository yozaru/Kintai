require 'test_helper'

class KintaisControllerTest < ActionController::TestCase
  setup do
    @kintai = kintais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kintais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kintai" do
    assert_difference('Kintai.count') do
      post :create, kintai: { employee_id: @kintai.employee_id, name: @kintai.name, shusha: @kintai.shusha, taisha: @kintai.taisha }
    end

    assert_redirected_to kintai_path(assigns(:kintai))
  end

  test "should show kintai" do
    get :show, id: @kintai
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kintai
    assert_response :success
  end

  test "should update kintai" do
    patch :update, id: @kintai, kintai: { employee_id: @kintai.employee_id, name: @kintai.name, shusha: @kintai.shusha, taisha: @kintai.taisha }
    assert_redirected_to kintai_path(assigns(:kintai))
  end

  test "should destroy kintai" do
    assert_difference('Kintai.count', -1) do
      delete :destroy, id: @kintai
    end

    assert_redirected_to kintais_path
  end
end
