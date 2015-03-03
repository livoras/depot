require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  set_fixture_class :fucking_options => Option

  test "should get index" do
    get :index
    assert_response :success
    assert_select "h3", "iPhone 6"
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
