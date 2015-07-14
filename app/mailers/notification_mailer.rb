class NotificationMailer < ActionMailer::Base
  default from: "no-reply@enrolnowapp.com"

  def registered
  end

  def session_signed_up(cart)
  	@sessions = course_titles = cart.line_items.map(&:session)
  	course_titles = cart.line_items.map(&:session).map(&:course).uniq.map(&:title)
  	@user = cart.user

  	mail(to: @user.email,
  		subject: "You have now signed up to #{course_titles.to_s} sessions")
  end

  def request_invoice(cart, user)
    @cart = cart
    @sessions = cart.line_items.map(&:session)
    @course_titles = cart.line_items.map(&:session).map(&:course).uniq.map(&:title)

    mail(to: user.email,
      subject: "Your invoice for #{@course_titles.to_s} sessions")
  end

end
