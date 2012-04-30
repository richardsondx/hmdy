class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  rescue_from Timeout::Error, with: :handle_timeout

    def handle_timeout(exception)
      # handle timeout error
    end
  
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

