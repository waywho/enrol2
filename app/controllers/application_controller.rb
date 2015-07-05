class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def afte_sign_in_path_for(user)
  	request.referrer
  end

  def afte_sign_out_path_for(user)
  	request.referrer
  end
end
