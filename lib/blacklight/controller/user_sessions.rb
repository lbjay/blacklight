module Blacklight::Controller::UserSessions
  
  def self.included base
    # base.instance_eval do
    #   # class-level method calls here...
    # end
    base.send :include, InstanceMethods
  end
  
  module InstanceMethods

    def new
      @user_session = UserSession.new
    end

    def create
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = "Welcome #{@user_session.login}!"
        redirect_to root_path
      else
        flash.now[:error] =  "Couldn't locate a user with those credentials"
        render :action => :new
      end
    end

    def destroy
      current_user_session.destroy
      flash[:notice] = "You have successfully logged out."
      redirect_to root_path
    end
  
  end
  
end