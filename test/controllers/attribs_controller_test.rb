require 'test_helper'

class AttribsControllerTest < ActionController::TestCase
  setup do
    @attrib = attribs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attribs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attrib" do
    assert_difference('Attrib.count') do
      post :create, attrib: { extra: @attrib.extra, name: @attrib.name, system_id: @attrib.system_id, type: @attrib.type }
    end

    assert_redirected_to attrib_path(assigns(:attrib))
  end

  test "should show attrib" do
    get :show, id: @attrib
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attrib
    assert_response :success
  end

  test "should update attrib" do
    patch :update, id: @attrib, attrib: { extra: @attrib.extra, name: @attrib.name, system_id: @attrib.system_id, type: @attrib.type }
    assert_redirected_to attrib_path(assigns(:attrib))
  end

  test "should destroy attrib" do
    assert_difference('Attrib.count', -1) do
      delete :destroy, id: @attrib
    end

    assert_redirected_to attribs_path
  end
end
