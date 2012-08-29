class PresentationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_course , except: [:index]


  def index
    @presentations = current_user.presentations.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presentations }
    end
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    @presentation = presentation_scope.where(id: params[:id], user: current_user).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presentation }
    end
  end

  # GET /presentations/new
  # GET /presentations/new.json
  def new
    @presentation = presentation_scope.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presentation }
    end
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = presentation_scope.new(params[:presentation])
    @presentation.user = current_user 
    respond_to do |format|
      if @presentation.save
        format.html { redirect_to @course, flash: {success: 'Gracias por participar'} }
        format.json { render json: @presentation, status: :created, location: @presentation }
      else
        flash[:error] = 'Formato Incorrecto. Intente de nuevo'
        format.html { render action: "new" }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def load_course
    @course = Course.find(params[:course_id])
  end

  def presentation_scope
    @presentation_scope ||= @course.presentations
  end

  

end
