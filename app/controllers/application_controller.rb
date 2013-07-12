class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :logged_in_and_activated

  def logged_in_and_activated
    unless logged_in? && current_user.activation_token.nil?

      redirect_to new_session_url
    end
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

end
