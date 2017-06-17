class Instructor::CoursesController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_course, :only => [:show]


	def new
		@course = Course.new
	end

	def create
		@course = current_user.courses.create(course_params)
		redirect_to instructor_course_path(@course)
	end

	def show

	end

	private

	def course_params
		params.require(:course).permit(:title, :description, :id)
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
