module Blacklight::Controller::Users
  
  def self.included base
    base.instance_eval do
      # see vendor/plugins/resource_controller
      resource_controller :singleton
      create.flash { "Welcome #{@user.login}!"}
    end
    base.send :include, InstanceMethods
  end
  
  module InstanceMethods

    protected
  
    def object
      @object ||= current_user
    end
  
  end
  
end