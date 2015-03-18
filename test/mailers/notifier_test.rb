require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  set_fixture_class :fucking_options => Option

  test "order_received" do
    mail = Notifier.order_received orders(:one)
    # assert_equal "Order received", mail.subject
    # assert_equal ["to@example.org"], mail.to
    assert_equal ["noreplylivoras@163.com"], mail.from
    # assert_match "Hi", mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped
    # assert_equal "Order shipped", mail.subject
    # assert_equal ["to@example.org"], mail.to
    assert_equal ["noreplylivoras@163.com"], mail.from
    # assert_match "Hi", mail.body.encoded
  end

end