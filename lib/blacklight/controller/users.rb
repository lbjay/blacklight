module Blacklight::Controller::Users
  
  def self.included base
    base.class_eval do
      # see vendor/plugins/resource_controller
      resource_controller :singleton
      create.flash { "Welcome #{@user.login}!"}
    end
  end
  
  protected
  
  def object
    @object ||= current_user
  end
  
end