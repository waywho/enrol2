class NotificationMailer < ActionMailer::Base
  default from: "no-reply@enrolnowapp.com"

  def registered
  end

  def session_signed_up(cart)
  	@sessions = course_titles = cart.line_items.map(&:session)
  	course_titles = cart.line_items.map(&:session).map(&:course).uniq.map(&:title)
  	@user = cart.user

  	mail(to: @user.email,
  		subject: "You have now signed up to #{course_titles} sessions")
  end
end
