class Notifier < ApplicationMailer
  default :from => "noreplylivoras@163.com"

  def order_received(order)
    @order = order

    mail to: order.email, subject: "你的订单已确定", cc: "livoras@163.com"
  end

  def order_shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
