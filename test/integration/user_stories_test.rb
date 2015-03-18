require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  set_fixture_class :fucking_options => Option
  fixtures :all

  test "User story" do

    Order.delete_all
    Cart.delete_all

    @product = products(:one)

    get "/" 
    assert_response :success
    assert_template "index"

    xml_http_request :post, "/line_items", :product_id => @product.id
    assert_response :success

    cart = Cart.find session[:cart_id]
    assert cart.line_items.count == 1

    get "/orders/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/orders", :order => {:name => "This is good",
                                            :address => "address",
                                            :email => "example@mail.com",
                                            :pay_type => "fuck"}
    assert_response :success
    assert_template "index"
    cart = Cart.find session[:cart_id]
    assert_equal 0, cart.line_items.size

    mail = ActionMailer::Base.deliveries.last
    assert_equal mail.to, ["example@mail.com"]
    assert_equal mail.from, ["noreplylivoras@163.com"]

  end
end
