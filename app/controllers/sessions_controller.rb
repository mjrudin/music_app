class SessionsController < ApplicationController

  skip_before_filter :logged_in_and_activated

  def create
    user = User.find_by_email_and_password(params[:user][:email],      params[:user][:password])
    if user
      session_token = SecureRandom.urlsafe_base64
      user.session_token = session_token
      user.save
      session[:session_token] = session_token
      redirect_to bands_url
    else
      flash.now[:notices] ||= []
      flash.now[:notices] << "Invalid email/password"

      render :new
    end
  end

  def destroy
    user = User.find_by_session_token(session[:session_token])
    user.session_token = nil
    user.save
    session[:session_token] = nil
    render :new
  end

end
