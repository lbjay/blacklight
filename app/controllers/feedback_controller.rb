class FeedbackController < ApplicationController
  
  # http://expressica.com/simple_captcha/
  # include SimpleCaptcha::ControllerHelpers
  
  # show the feedback form
  def show
    @errors=[]
    if request.method==:post
      if validate
        Notifier.deliver_feedback(params)
        redirect_to feedback_complete_path
      end
    end
  end
  
  protected
  
  # validates the incoming params
  # returns either an empty array or an array with error messages
  def validate
    unless params[:name] =~ /\w+/
      @errors << I18n.t(:"feedback.error.name")
    end
    unless params[:email] =~ /\w+@\w+\.\w+/
      @errors << I18n.t(:"feedback.error.email")
    end
    unless params[:message] =~ /\w+/
      @errors << I18n.t(:"feedback.error.message")
    end
    #unless simple_captcha_valid?
    #  @errors << 'Captcha did not match'
    #end
    @errors.empty?
  end
  
end
