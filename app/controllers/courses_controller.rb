class CoursesController < ApplicationController
  def index
    @courses = Course.actives.all
  end


  def show
    @course = Course.find(params[:id])
  end


end
