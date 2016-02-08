require 'test_helper'

class NomenclatorsControllerTest < ActionController::TestCase
  setup do
    @nomenclator = nomenclators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nomenclators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nomenclator" do
    assert_difference('Nomenclator.count') do
      post :create, nomenclator: { description: @nomenclator.description, name: @nomenclator.name }
    end

    assert_redirected_to nomenclator_path(assigns(:nomenclator))
  end

  test "should show nomenclator" do
    get :show, id: @nomenclator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nomenclator
    assert_response :success
  end

  test "should update nomenclator" do
    patch :update, id: @nomenclator, nomenclator: { description: @nomenclator.description, name: @nomenclator.name }
    assert_redirected_to nomenclator_path(assigns(:nomenclator))
  end

  test "should destroy nomenclator" do
    assert_difference('Nomenclator.count', -1) do
      delete :destroy, id: @nomenclator
    end

    assert_redirected_to nomenclators_path
  end
end
