require 'test_helper'

class ValuesControllerTest < ActionController::TestCase
  setup do
    @value = values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attvalues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create value" do
    assert_difference('Attvalue.count') do
      post :create, value: { attrib_id: @value.attrib_id, patient_id: @value.patient_id, value: @value.value }
    end

    assert_redirected_to value_path(assigns(:value))
  end

  test "should show value" do
    get :show, id: @value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @value
    assert_response :success
  end

  test "should update value" do
    patch :update, id: @value, value: { attrib_id: @value.attrib_id, patient_id: @value.patient_id, value: @value.value }
    assert_redirected_to value_path(assigns(:value))
  end

  test "should destroy value" do
    assert_difference('Attvalue.count', -1) do
      delete :destroy, id: @value
    end

    assert_redirected_to values_path
  end
end
