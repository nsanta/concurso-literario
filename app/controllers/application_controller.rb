class ApplicationController < ActionController::Base
  protect_from_forgery

  protected


  def authorize_admin!
    unless current_user.admin?
      raise ActiveRecord::NotFound
      return false
    end
  end

  def self.define_authorization(resource)
    before_filter lambda{ |controller|  controller.send(:authorize_management!, resource) },
                  :only => [:new,:create,:edit,:update,:destroy]
    before_filter lambda{ |controller|  controller.send(:authorize_read!, resource) },
                  :except => [:new,:create,:edit,:update,:destroy]
  end

  def authorize_management!(resource)
    authorize! :manage, resource 
  end

  def authorize_read!(resource)
    authorize! :read, resource 
  end 

end
