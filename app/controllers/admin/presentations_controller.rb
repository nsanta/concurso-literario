class Admin::PresentationsController < Admin::BaseController
  define_authorization :course
  before_filter :load_course
  
  def index
    @presentations = @course.presentations.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presentations}
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @presentation = @course.presentations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presentation }
    end
  end

  private

  def load_course
    @course = Course.find(params[:course_id])
  end
end


