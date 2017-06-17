class Instructor::SessionsController < ApplicationController
	before_action :authenticate_user!
  # before_action :require_authorized_for_current_course, :only => [:create]

  def show
    @session = Session.find(params[:id])
  end

	def new
		@session = Session.new
	end

  def create
    @session = current_course.sessions.create(session_params)
    redirect_to instructor_course_path(current_course)
  end

  private

  def session_params
    params.require(:session).permit(:course_id, :address, :postal_code, :latitude, :longtitude,
      :cost, :location, :start, :end)
  end

  def require_authorized_for_current_course
    if current_course.user != current_user
      return render :text => 'Unauthorized', :status => :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    @course ||= Course.find(params[:id]) 
  end
end