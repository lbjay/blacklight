class UsersController < ApplicationController
  
  # see vendor/plugins/resource_controller
  resource_controller :singleton
  
  create.flash { I18n.t(:"user_sessions.greeting", :who => @user.login) }
  
  protected
  def object
    @object ||= current_user
  end
  
end
