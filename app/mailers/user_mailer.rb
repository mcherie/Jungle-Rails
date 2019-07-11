class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Order has been received. Order ID: #{order.id}" )
  end

end
