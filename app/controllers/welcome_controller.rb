class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @courses = Course.actives.all
  end
end
