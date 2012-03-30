require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get _board" do
    get :_board
    assert_response :success
  end

  test "should get _forum" do
    get :_forum
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
